require 'test_helper'

class ExpirationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get expirations_index_url
    assert_response :success
  end

end
