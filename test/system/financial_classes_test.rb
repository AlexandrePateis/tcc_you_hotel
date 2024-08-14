require "application_system_test_case"

class FinancialClassesTest < ApplicationSystemTestCase
  setup do
    @financial_class = financial_classes(:one)
  end

  test "visiting the index" do
    visit financial_classes_url
    assert_selector "h1", text: "Financial classes"
  end

  test "should create financial class" do
    visit financial_classes_url
    click_on "New financial class"

    fill_in "Abbreviation", with: @financial_class.abbreviation
    check "Is revenue" if @financial_class.is_revenue
    fill_in "Name", with: @financial_class.name
    click_on "Create Financial class"

    assert_text "Financial class was successfully created"
    click_on "Back"
  end

  test "should update Financial class" do
    visit financial_class_url(@financial_class)
    click_on "Edit this financial class", match: :first

    fill_in "Abbreviation", with: @financial_class.abbreviation
    check "Is revenue" if @financial_class.is_revenue
    fill_in "Name", with: @financial_class.name
    click_on "Update Financial class"

    assert_text "Financial class was successfully updated"
    click_on "Back"
  end

  test "should destroy Financial class" do
    visit financial_class_url(@financial_class)
    click_on "Destroy this financial class", match: :first

    assert_text "Financial class was successfully destroyed"
  end
end
