# frozen_string_literal: true
require "test_helper"

class EmailControllerTest < ActionDispatch::IntegrationTest
  test "should get create:post" do
    post emails_url, params: { email: { name: "name" } }
    assert_response :success
  end
end
