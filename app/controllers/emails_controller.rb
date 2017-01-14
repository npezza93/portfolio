# frozen_string_literal: true
class EmailsController < ApplicationController
  def create
    @email = Email.new(email_params)

    if @email.save
      render json: @email
    else
      render json: nil
    end
  end

  private

  def email_params
    params.require(:email).permit(:name, :email, :message)
  end
end
