require "test_helper"

class FinancialClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @financial_class = financial_classes(:one)
  end

  test "should get index" do
    get financial_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_financial_class_url
    assert_response :success
  end

  test "should create financial_class" do
    assert_difference("FinancialClass.count") do
      post financial_classes_url, params: { financial_class: { abbreviation: @financial_class.abbreviation, is_revenue: @financial_class.is_revenue, name: @financial_class.name } }
    end

    assert_redirected_to financial_class_url(FinancialClass.last)
  end

  test "should show financial_class" do
    get financial_class_url(@financial_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_financial_class_url(@financial_class)
    assert_response :success
  end

  test "should update financial_class" do
    patch financial_class_url(@financial_class), params: { financial_class: { abbreviation: @financial_class.abbreviation, is_revenue: @financial_class.is_revenue, name: @financial_class.name } }
    assert_redirected_to financial_class_url(@financial_class)
  end

  test "should destroy financial_class" do
    assert_difference("FinancialClass.count", -1) do
      delete financial_class_url(@financial_class)
    end

    assert_redirected_to financial_classes_url
  end
end
