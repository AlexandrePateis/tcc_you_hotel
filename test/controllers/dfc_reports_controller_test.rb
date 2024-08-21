require "test_helper"

class DfcReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dfc_reports_index_url
    assert_response :success
  end
end
