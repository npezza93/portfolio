# frozen_string_literal: true

class EmailsController < ApplicationController
  def create
    return unless valid_recaptcha?(params["h-captcha-response"])

    @email = Email.new(email_params)

    @email.save
  end

  private

  def email_params
    params.require(:email).permit(:name, :email, :message)
  end

  def valid_recaptcha?(token)
    secret_key = ENV["HCAPTCHA_SECRET_KEY"]

    uri = URI.parse("https://hcaptcha.com/siteverify")
    response = Net::HTTP.post(
      uri, { 'secret': secret_key, 'response': token }.to_query
    )

    json = JSON.parse(response.body)
    json["success"]
  end
end
