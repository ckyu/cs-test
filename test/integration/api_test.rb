require 'test_helper'

class ApiTest < ActiveSupport::TestCase

  def setup
    @patient = patients(:steven)
    @payload   = <<-JSON
      { "343434342": {
          "Urinalysis": {
            "date": "1970-01-01",
            "location": "Hospital A",
            "physician": "Doctor Who",
            "data": {
              "Color": {
                "value": "Green"
              }
            }
          }
        }
      }
      JSON
    @session = ActionDispatch::Integration::Session.new(Rails.application)
  end

  test "save should succeed if token is valid" do
    @token = Token.create
    # session = ActionDispatch::Integration::Session.new(Rails.application)
    @session.post "/save", {token: @token.token, payload: @payload}
    assert_equal 200, @session.response.status
  end

  test "save should fail if token has expired" do
    @token = Token.create
    sleep 5
    @session.post "/save", {token: @token.token, payload: @payload}
    assert_equal 500, @session.response.status
  end

  test "save should fail if token is not in database" do
    token = "a" * 12
    @session.post "/save", {token: token, payload: @payload}
    assert_equal 500, @session.response.status
  end

  test "error when patient does not exist" do
    @session.get "/patients/1"
    assert_equal 404, @session.response.status
  end

end