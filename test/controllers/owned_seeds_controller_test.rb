require 'test_helper'

class OwnedSeedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @owned_seed = owned_seeds(:one)
  end

  test "should get index" do
    get owned_seeds_index_url
    assert_response :success
  end

  test "should get new" do
    get new_owned_seed_url
    assert_response :success
  end

  test "should create owned_seed" do
    assert_difference('OwnedSeeds.count') do
      post owned_seeds_index_url, params: { owned_seed: { flower_type_id: @owned_seed.flower_type_id, quantity: @owned_seed.quantity, user_profile_id: @owned_seed.user_profile_id } }
    end

    assert_redirected_to owned_seed_url(OwnedSeeds.last)
  end

  test "should show owned_seed" do
    get owned_seed_url(@owned_seed)
    assert_response :success
  end

  test "should get edit" do
    get edit_owned_seed_url(@owned_seed)
    assert_response :success
  end

  test "should update owned_seed" do
    patch owned_seed_url(@owned_seed), params: { owned_seed: { flower_type_id: @owned_seed.flower_type_id, quantity: @owned_seed.quantity, user_profile_id: @owned_seed.user_profile_id } }
    assert_redirected_to owned_seed_url(@owned_seed)
  end

  test "should destroy owned_seed" do
    assert_difference('OwnedSeeds.count', -1) do
      delete owned_seed_url(@owned_seed)
    end

    assert_redirected_to owned_seeds_index_url
  end
end
