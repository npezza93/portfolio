# frozen_string_literal: true

class EmailsController < ApplicationController
  RECAPTCHA_MINIMUM_SCORE = 0.5

  def create
    return unless valid_recaptcha?(params[:recaptcha_token])

    @email = Email.new(email_params)

    @email.save
  end

  private

  def email_params
    params.require(:email).permit(:name, :email, :message)
  end

  def valid_recaptcha?(token)
    secret_key = ENV["RECAPTCHA_SECRET_KEY"]

    uri = URI.parse("https://www.google.com/recaptcha/api/siteverify?secret=#{secret_key}&response=#{token}")
    response = Net::HTTP.get_response(uri)
    json = JSON.parse(response.body)
    json["success"] && json["score"] > RECAPTCHA_MINIMUM_SCORE &&
      json["action"] == "email"
  end
end
