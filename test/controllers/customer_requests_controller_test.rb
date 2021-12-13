require 'test_helper'

class CustomerRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_request = customer_requests(:one)
  end

  test "should get index" do
    get customer_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_request_url
    assert_response :success
  end

  test "should create customer_request" do
    assert_difference('CustomerRequest.count') do
      post customer_requests_url, params: { customer_request: { flower_type_id: @customer_request.flower_type_id, quantity: @customer_request.quantity, user_profile_id: @customer_request.user_profile_id } }
    end

    assert_redirected_to customer_request_url(CustomerRequest.last)
  end

  test "should show customer_request" do
    get customer_request_url(@customer_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_request_url(@customer_request)
    assert_response :success
  end

  test "should update customer_request" do
    patch customer_request_url(@customer_request), params: { customer_request: { flower_type_id: @customer_request.flower_type_id, quantity: @customer_request.quantity, user_profile_id: @customer_request.user_profile_id } }
    assert_redirected_to customer_request_url(@customer_request)
  end

  test "should destroy customer_request" do
    assert_difference('CustomerRequest.count', -1) do
      delete customer_request_url(@customer_request)
    end

    assert_redirected_to customer_requests_url
  end
end
