class Email < ApplicationRecord
  after_commit :send_email, on: :create

  private

  def send_email
    puts self
  end
end
