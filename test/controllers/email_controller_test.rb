# frozen_string_literal: true

require "test_helper"

class EmailControllerTest < ActionDispatch::IntegrationTest
  test "should create" do
    assert_difference -> { ActionMailer::Base.deliveries.size } do
      post emails_url, params: { email: {
        name: "name", email: "email@email.com", message: "message"
      } }
      assert_response :success
    end
  end
end
