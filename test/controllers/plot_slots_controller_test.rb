require 'test_helper'

class PlotSlotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plot_slot = plot_slots(:one)
  end

  test "should get index" do
    get plot_slots_url
    assert_response :success
  end

  test "should get new" do
    get new_plot_slot_url
    assert_response :success
  end

  test "should create plot_slot" do
    assert_difference('PlotSlot.count') do
      post plot_slots_url, params: { plot_slot: { flower_type_id: @plot_slot.flower_type_id, user_profile_id: @plot_slot.user_profile_id, when_planted: @plot_slot.when_planted, when_watered: @plot_slot.when_watered, x: @plot_slot.x, y: @plot_slot.y } }
    end

    assert_redirected_to plot_slot_url(PlotSlot.last)
  end

  test "should show plot_slot" do
    get plot_slot_url(@plot_slot)
    assert_response :success
  end

  test "should get edit" do
    get edit_plot_slot_url(@plot_slot)
    assert_response :success
  end

  test "should update plot_slot" do
    patch plot_slot_url(@plot_slot), params: { plot_slot: { flower_type_id: @plot_slot.flower_type_id, user_profile_id: @plot_slot.user_profile_id, when_planted: @plot_slot.when_planted, when_watered: @plot_slot.when_watered, x: @plot_slot.x, y: @plot_slot.y } }
    assert_redirected_to plot_slot_url(@plot_slot)
  end

  test "should destroy plot_slot" do
    assert_difference('PlotSlot.count', -1) do
      delete plot_slot_url(@plot_slot)
    end

    assert_redirected_to plot_slots_url
  end
end
