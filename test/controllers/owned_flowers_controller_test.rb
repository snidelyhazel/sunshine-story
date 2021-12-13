require 'test_helper'

class OwnedFlowersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @owned_flower = owned_flowers(:one)
  end

  test "should get index" do
    get owned_flowers_index_url
    assert_response :success
  end

  test "should get new" do
    get new_owned_flower_url
    assert_response :success
  end

  test "should create owned_flower" do
    assert_difference('OwnedFlowers.count') do
      post owned_flowers_index_url, params: { owned_flower: { flower_type_id: @owned_flower.flower_type_id, quantity: @owned_flower.quantity, user_profile_id: @owned_flower.user_profile_id } }
    end

    assert_redirected_to owned_flower_url(OwnedFlowers.last)
  end

  test "should show owned_flower" do
    get owned_flower_url(@owned_flower)
    assert_response :success
  end

  test "should get edit" do
    get edit_owned_flower_url(@owned_flower)
    assert_response :success
  end

  test "should update owned_flower" do
    patch owned_flower_url(@owned_flower), params: { owned_flower: { flower_type_id: @owned_flower.flower_type_id, quantity: @owned_flower.quantity, user_profile_id: @owned_flower.user_profile_id } }
    assert_redirected_to owned_flower_url(@owned_flower)
  end

  test "should destroy owned_flower" do
    assert_difference('OwnedFlowers.count', -1) do
      delete owned_flower_url(@owned_flower)
    end

    assert_redirected_to owned_flowers_index_url
  end
end
