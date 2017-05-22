require 'test_helper'

class PlayControllerTest < ActionDispatch::IntegrationTest
  test "should get play" do
    get play_play_url
    assert_response :success
  end

end
