# frozen_string_literal: true
class ApplicationMailer < ActionMailer::Base
  default to: ENV["email_to"]
  layout "mailer"
end
