require 'test_helper'

class CustomerRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "each customer_request has an associated flower_type" do
    customer_requests = CustomerRequest.all()
    customer_requests.each do |customer_request|
      assert_not_nil(customer_request.flower_type, "there is not an associated flower_type for all customer_requests :(")
    end
  end

  test "all customer_requests are for 1-5 flowers" do
    customer_requests = CustomerRequest.all()
    customer_requests.each do |customer_request|
      assert(customer_request.quantity > 0, "this customer_request has too few flowers :(")
      assert(customer_request.quantity <= 5, "this customer_request has too many flowers :(")
    end
  end

  test "ensure each flower_type has a quantity of owned_seeds" do
    flower_types = FlowerType.all()
    flower_types.each do |flower_type|
      assert_not_nil(CustomerRequest.find_by_flower_type_id(flower_type.id), "this flower_type is not associated with a customer_request :(")
    end
  end

end
