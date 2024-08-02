require "application_system_test_case"

class GuestsTest < ApplicationSystemTestCase
  setup do
    @guest = guests(:one)
  end

  test "visiting the index" do
    visit guests_url
    assert_selector "h1", text: "Guests"
  end

  test "should create guest" do
    visit guests_url
    click_on "New guest"

    fill_in "Address", with: @guest.address_id
    fill_in "Birthdate", with: @guest.birthdate
    fill_in "Father name", with: @guest.father_name
    fill_in "Gender", with: @guest.gender
    fill_in "Mother name", with: @guest.mother_name
    fill_in "Name", with: @guest.name
    fill_in "Phone", with: @guest.phone
    click_on "Create Guest"

    assert_text "Guest was successfully created"
    click_on "Back"
  end

  test "should update Guest" do
    visit guest_url(@guest)
    click_on "Edit this guest", match: :first

    fill_in "Address", with: @guest.address_id
    fill_in "Birthdate", with: @guest.birthdate
    fill_in "Father name", with: @guest.father_name
    fill_in "Gender", with: @guest.gender
    fill_in "Mother name", with: @guest.mother_name
    fill_in "Name", with: @guest.name
    fill_in "Phone", with: @guest.phone
    click_on "Update Guest"

    assert_text "Guest was successfully updated"
    click_on "Back"
  end

  test "should destroy Guest" do
    visit guest_url(@guest)
    click_on "Destroy this guest", match: :first

    assert_text "Guest was successfully destroyed"
  end
end
