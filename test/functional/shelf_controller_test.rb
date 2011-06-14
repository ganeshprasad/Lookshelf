require 'test_helper'

class ShelfControllerTest < ActionController::TestCase
  test "should get zoom_in" do
    get :zoom_in
    assert_response :success
  end

end
