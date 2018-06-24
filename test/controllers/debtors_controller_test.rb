require 'test_helper'

class DebtorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get debtors_index_url
    assert_response :success
  end

end
