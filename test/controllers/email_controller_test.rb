# frozen_string_literal: true

require "test_helper"
require "minitest/autorun"

class EmailControllerTest < ActionDispatch::IntegrationTest
  test "should not create" do
    response_mock = Minitest::Mock.new.expect(
      :body, { "success": false, "score": 1, "action": "email" }.to_json
    )

    Net::HTTP.stub(:get_response, response_mock) do
      assert_no_difference -> { ActionMailer::Base.deliveries.size } do
        post emails_url, params: { email: {
          name: "name", email: "email@email.com", message: "message"
        } }
        assert_response :success
      end
    end
  end

  test "should create" do
    response_mock = Minitest::Mock.new.expect(
      :body, { "success": true, "score": 1, "action": "email" }.to_json
    )

    Net::HTTP.stub(:get_response, response_mock) do
      assert_difference -> { ActionMailer::Base.deliveries.size } do
        post emails_url, params: { email: {
          name: "name", email: "email@email.com", message: "message"
        } }
        assert_response :success
      end
    end
  end
end
