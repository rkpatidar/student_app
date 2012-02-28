require 'test_helper'

class IssuedbookControllerTest < ActionController::TestCase
  test "should get issuedbook" do
    get :issuedbook
    assert_response :success
  end

end
