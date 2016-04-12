class ApplicationMailer < ActionMailer::Base
  helper ApplicationHelper

  default from: "tms_50@trainning.com"
  layout "mailer"
end
