class SupervisorWorker
  include Sidekiq::Worker

  MONTHLY_REPORT = 1
  DAILY_REPORT = 2
  COURSE_FINISH = 3

  def perform action
    case action
    when MONTHLY_REPORT
      send_email_monthly_report
    end
  end

  private
  def send_email_monthly_report
    @supervisors = User.supervisor_has_course
    @supervisors.each do |supervisor|
      SupervisorMailer.last_day_month_summary(supervisor).deliver
    end
  end
end
