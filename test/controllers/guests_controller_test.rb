require "test_helper"

class GuestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guest = guests(:one)
  end

  test "should get index" do
    get guests_url
    assert_response :success
  end

  test "should get new" do
    get new_guest_url
    assert_response :success
  end

  test "should create guest" do
    assert_difference("Guest.count") do
      post guests_url, params: { guest: { address_id: @guest.address_id, birthdate: @guest.birthdate, father_name: @guest.father_name, gender: @guest.gender, mother_name: @guest.mother_name, name: @guest.name, phone: @guest.phone } }
    end

    assert_redirected_to guest_url(Guest.last)
  end

  test "should show guest" do
    get guest_url(@guest)
    assert_response :success
  end

  test "should get edit" do
    get edit_guest_url(@guest)
    assert_response :success
  end

  test "should update guest" do
    patch guest_url(@guest), params: { guest: { address_id: @guest.address_id, birthdate: @guest.birthdate, father_name: @guest.father_name, gender: @guest.gender, mother_name: @guest.mother_name, name: @guest.name, phone: @guest.phone } }
    assert_redirected_to guest_url(@guest)
  end

  test "should destroy guest" do
    assert_difference("Guest.count", -1) do
      delete guest_url(@guest)
    end

    assert_redirected_to guests_url
  end
end
