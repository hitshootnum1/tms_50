class SupervisorMailer < ApplicationMailer

  def last_day_month_summary supervisor
    @supervisor = supervisor
    @courses = @supervisor.created_courses
    mail to: @supervisor.email, subject: Settings.email_subject.last_day_month
  end

  def last_day_summary supervisor, user_tasks
    @supervisor = supervisor
    @user_tasks = user_tasks
    mail to: @supervisor.email, subject: Settings.email_subject.last_day
  end

  def notify_course_finish_in_two_days course
    @course = course
    @supervisor = @course.user
    mail to: @supervisor.email,
      subject: Settings.email_subject.two_days_finish_course
  end
end
