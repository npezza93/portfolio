# frozen_string_literal: true
class ApplicationMailer < ActionMailer::Base
  default to: ENV["EMAIL_TO"]
  layout "mailer"
end
