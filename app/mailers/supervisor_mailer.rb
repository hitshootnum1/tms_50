class SupervisorMailer < ApplicationMailer

  def last_day_month_summary supervisor
    @supervisor = supervisor
    @courses = @supervisor.created_courses
    mail to: @supervisor.email, subject: Settings.email_subject.last_day_month
  end
end
