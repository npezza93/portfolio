# frozen_string_literal: true

require "test_helper"

class EmailMailerTest < ActionMailer::TestCase
  setup do
    @email = emails(:one)
    @mailer = EmailMailer.contact(@email.id)
  end

  test "contact" do
    assert_equal "New contact submission", @mailer.subject
    assert_equal ["no-reply@example.com"], @mailer.to
    assert_equal [@email.email], @mailer.from
    assert_match @email.message, @mailer.body.encoded
  end
end
