require "application_system_test_case"

class OwnedSeedsTest < ApplicationSystemTestCase
  setup do
    @owned_seed = owned_seeds(:one)
  end

  test "visiting the index" do
    visit owned_seeds_url
    assert_selector "h1", text: "Owned Seeds"
  end

  test "creating a Owned seeds" do
    visit owned_seeds_url
    click_on "New Owned Seeds"

    fill_in "Flower type", with: @owned_seed.flower_type_id
    fill_in "Quantity", with: @owned_seed.quantity
    fill_in "User profile", with: @owned_seed.user_profile_id
    click_on "Create Owned seeds"

    assert_text "Owned seeds was successfully created"
    click_on "Back"
  end

  test "updating a Owned seeds" do
    visit owned_seeds_url
    click_on "Edit", match: :first

    fill_in "Flower type", with: @owned_seed.flower_type_id
    fill_in "Quantity", with: @owned_seed.quantity
    fill_in "User profile", with: @owned_seed.user_profile_id
    click_on "Update Owned seeds"

    assert_text "Owned seeds was successfully updated"
    click_on "Back"
  end

  test "destroying a Owned seeds" do
    visit owned_seeds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Owned seeds was successfully destroyed"
  end
end
