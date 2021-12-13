require "application_system_test_case"

class PlotSlotsTest < ApplicationSystemTestCase
  setup do
    @plot_slot = plot_slots(:one)
  end

  test "visiting the index" do
    visit plot_slots_url
    assert_selector "h1", text: "Plot Slots"
  end

  test "creating a Plot slot" do
    visit plot_slots_url
    click_on "New Plot Slot"

    fill_in "Flower type", with: @plot_slot.flower_type_id
    fill_in "User profile", with: @plot_slot.user_profile_id
    fill_in "When planted", with: @plot_slot.when_planted
    fill_in "When watered", with: @plot_slot.when_watered
    fill_in "X", with: @plot_slot.x
    fill_in "Y", with: @plot_slot.y
    click_on "Create Plot slot"

    assert_text "Plot slot was successfully created"
    click_on "Back"
  end

  test "updating a Plot slot" do
    visit plot_slots_url
    click_on "Edit", match: :first

    fill_in "Flower type", with: @plot_slot.flower_type_id
    fill_in "User profile", with: @plot_slot.user_profile_id
    fill_in "When planted", with: @plot_slot.when_planted
    fill_in "When watered", with: @plot_slot.when_watered
    fill_in "X", with: @plot_slot.x
    fill_in "Y", with: @plot_slot.y
    click_on "Update Plot slot"

    assert_text "Plot slot was successfully updated"
    click_on "Back"
  end

  test "destroying a Plot slot" do
    visit plot_slots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Plot slot was successfully destroyed"
  end
end
