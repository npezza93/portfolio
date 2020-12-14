# frozen_string_literal: true

class Email < ApplicationRecord
  after_commit :send_email, on: :create

  private

  def send_email
    from = SendGrid::Email.new(email: email)
    subject = 'Hello contact submission'
    to = SendGrid::Email.new(email: ENV["EMAIL_TO"])
    content = SendGrid::Content.new(type: 'text/plain', value: message)
    mail = SendGrid::Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])

    sg.client.mail._('send').post(request_body: mail.to_json)
  end
end
