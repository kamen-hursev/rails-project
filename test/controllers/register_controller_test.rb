require 'test_helper'

class RegisterControllerTest < ActionController::TestCase
  test "should get select_brokers" do
    get :select_brokers
    assert_response :success
  end

end
