require "test_helper"

class LessonsControllerTest < ActionDispatch::IntegrationTest
  test "should get schedule" do
    get lessons_schedule_url
    assert_response :success
  end
end
