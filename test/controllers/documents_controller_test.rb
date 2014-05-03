require 'test_helper'

class DocumentsControllerTest < ActionController::TestCase
  test "should get select_file" do
    get :select_file
    assert_response :success
  end

  test "should get upload_file" do
    get :upload_file
    assert_response :success
  end

end
