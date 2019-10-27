# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/email_mailer
class EmailMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/email_mailer/contact
  def contact
    EmailMailer.contact
  end

end
