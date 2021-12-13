require "application_system_test_case"

class OwnedFlowersTest < ApplicationSystemTestCase
  setup do
    @owned_flower = owned_flowers(:one)
  end

  test "visiting the index" do
    visit owned_flowers_url
    assert_selector "h1", text: "Owned Flowers"
  end

  test "creating a Owned flowers" do
    visit owned_flowers_url
    click_on "New Owned Flowers"

    fill_in "Flower type", with: @owned_flower.flower_type_id
    fill_in "Quantity", with: @owned_flower.quantity
    fill_in "User profile", with: @owned_flower.user_profile_id
    click_on "Create Owned flowers"

    assert_text "Owned flowers was successfully created"
    click_on "Back"
  end

  test "updating a Owned flowers" do
    visit owned_flowers_url
    click_on "Edit", match: :first

    fill_in "Flower type", with: @owned_flower.flower_type_id
    fill_in "Quantity", with: @owned_flower.quantity
    fill_in "User profile", with: @owned_flower.user_profile_id
    click_on "Update Owned flowers"

    assert_text "Owned flowers was successfully updated"
    click_on "Back"
  end

  test "destroying a Owned flowers" do
    visit owned_flowers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Owned flowers was successfully destroyed"
  end
end
