class PostsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  
  test "should get index" do
    get(:index)
    assert_response :success
  end

  test "should redirect to sign in if no session exisists" do
    get(:new)
    assert_response :redirect
  end

  test "should get show" do
    get(:show, id: 1)
    assert_response :success
  end
end
