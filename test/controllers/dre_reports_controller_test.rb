require "test_helper"

class DreReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dre_reports_index_url
    assert_response :success
  end
end
