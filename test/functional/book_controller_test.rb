require 'test_helper'

class BookControllerTest < ActionController::TestCase
  test "should get addbook" do
    get :addbook
    assert_response :success
  end

  test "should get showbook" do
    get :showbook
    assert_response :success
  end

end
