require "application_system_test_case"

class CustomerRequestsTest < ApplicationSystemTestCase
  setup do
    @customer_request = customer_requests(:one)
  end

  test "visiting the index" do
    visit customer_requests_url
    assert_selector "h1", text: "Customer Requests"
  end

  test "creating a Customer request" do
    visit customer_requests_url
    click_on "New Customer Request"

    fill_in "Flower type", with: @customer_request.flower_type_id
    fill_in "Quantity", with: @customer_request.quantity
    fill_in "User profile", with: @customer_request.user_profile_id
    click_on "Create Customer request"

    assert_text "Customer request was successfully created"
    click_on "Back"
  end

  test "updating a Customer request" do
    visit customer_requests_url
    click_on "Edit", match: :first

    fill_in "Flower type", with: @customer_request.flower_type_id
    fill_in "Quantity", with: @customer_request.quantity
    fill_in "User profile", with: @customer_request.user_profile_id
    click_on "Update Customer request"

    assert_text "Customer request was successfully updated"
    click_on "Back"
  end

  test "destroying a Customer request" do
    visit customer_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customer request was successfully destroyed"
  end
end
