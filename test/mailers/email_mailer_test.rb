# frozen_string_literal: true

require "test_helper"

class EmailMailerTest < ActionMailer::TestCase
  test "contact" do
    mail = EmailMailer.contact
    assert_equal "Contact", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
