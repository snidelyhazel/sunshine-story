require 'test_helper'

class FlowerTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flower_type = flower_types(:one)
  end

  test "should get index" do
    get flower_types_url
    assert_response :success
  end

  test "should get new" do
    get new_flower_type_url
    assert_response :success
  end

  test "should create flower_type" do
    assert_difference('FlowerType.count') do
      post flower_types_url, params: { flower_type: { buy_price: @flower_type.buy_price, color: @flower_type.color, graphic: @flower_type.graphic, growth_duration_seconds: @flower_type.growth_duration_seconds, harvest_duration_seconds: @flower_type.harvest_duration_seconds, max_water_interval: @flower_type.max_water_interval, name: @flower_type.name, sell_price: @flower_type.sell_price } }
    end

    assert_redirected_to flower_type_url(FlowerType.last)
  end

  test "should show flower_type" do
    get flower_type_url(@flower_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_flower_type_url(@flower_type)
    assert_response :success
  end

  test "should update flower_type" do
    patch flower_type_url(@flower_type), params: { flower_type: { buy_price: @flower_type.buy_price, color: @flower_type.color, graphic: @flower_type.graphic, growth_duration_seconds: @flower_type.growth_duration_seconds, harvest_duration_seconds: @flower_type.harvest_duration_seconds, max_water_interval: @flower_type.max_water_interval, name: @flower_type.name, sell_price: @flower_type.sell_price } }
    assert_redirected_to flower_type_url(@flower_type)
  end

  test "should destroy flower_type" do
    assert_difference('FlowerType.count', -1) do
      delete flower_type_url(@flower_type)
    end

    assert_redirected_to flower_types_url
  end
end
