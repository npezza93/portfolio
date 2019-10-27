# frozen_string_literal: true

class EmailMailer < ApplicationMailer
  def contact(email_id)
    @email = Email.find(email_id)

    mail from: @email.email, subject: "New contact submission"
  end
end
