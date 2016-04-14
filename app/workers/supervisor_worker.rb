class SupervisorWorker
  include Sidekiq::Worker

  MONTHLY_REPORT = 1
  DAILY_REPORT = 2
  COURSE_FINISH = 3

  def perform action
    case action
    when MONTHLY_REPORT
      send_email_monthly_report
    when DAILY_REPORT
      send_email_daily_report
    end
  end

  private
  def send_email_monthly_report
    @supervisors = User.supervisor_has_course
    @supervisors.each do |supervisor|
      SupervisorMailer.last_day_month_summary(supervisor).deliver
    end
  end

  def send_email_daily_report
    Course.all.each do |course|
      supervisors = course.users.where(role: 1)
      user_tasks = course.user_tasks.select{|user_task| user_task.created_at.strftime("%Y-%m-%d") ==
        DateTime.now.strftime("%Y-%m-%d")}
      if supervisors.count > 0 && user_tasks.count > 0
        supervisors.each do |supervisor|
          SupervisorMailer.last_day_summary(supervisor, user_tasks).deliver
        end
      end
    end
  end
end
