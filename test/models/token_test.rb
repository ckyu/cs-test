require 'test_helper'

class TokenTest < ActiveSupport::TestCase
  def setup
    @token = Token.create
  end

  test "duplicate token is invalid" do
    @dup_token = Token.create
    @dup_token.token = @token.token
    assert_not @dup_token.valid?
  end

  test "expiry" do
    assert_equal 5.seconds.from_now.to_s, @token.expires_on.to_s
  end
end
