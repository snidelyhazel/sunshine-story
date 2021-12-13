require "application_system_test_case"

class FlowerTypesTest < ApplicationSystemTestCase
  setup do
    @flower_type = flower_types(:one)
  end

  test "visiting the index" do
    visit flower_types_url
    assert_selector "h1", text: "Flower Types"
  end

  test "creating a Flower type" do
    visit flower_types_url
    click_on "New Flower Type"

    fill_in "Buy price", with: @flower_type.buy_price
    fill_in "Color", with: @flower_type.color
    fill_in "Graphic", with: @flower_type.graphic
    fill_in "Growth duration seconds", with: @flower_type.growth_duration_seconds
    fill_in "Harvest duration seconds", with: @flower_type.harvest_duration_seconds
    fill_in "Max water interval", with: @flower_type.max_water_interval
    fill_in "Name", with: @flower_type.name
    fill_in "Sell price", with: @flower_type.sell_price
    click_on "Create Flower type"

    assert_text "Flower type was successfully created"
    click_on "Back"
  end

  test "updating a Flower type" do
    visit flower_types_url
    click_on "Edit", match: :first

    fill_in "Buy price", with: @flower_type.buy_price
    fill_in "Color", with: @flower_type.color
    fill_in "Graphic", with: @flower_type.graphic
    fill_in "Growth duration seconds", with: @flower_type.growth_duration_seconds
    fill_in "Harvest duration seconds", with: @flower_type.harvest_duration_seconds
    fill_in "Max water interval", with: @flower_type.max_water_interval
    fill_in "Name", with: @flower_type.name
    fill_in "Sell price", with: @flower_type.sell_price
    click_on "Update Flower type"

    assert_text "Flower type was successfully updated"
    click_on "Back"
  end

  test "destroying a Flower type" do
    visit flower_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Flower type was successfully destroyed"
  end
end
