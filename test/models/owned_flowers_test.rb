require 'test_helper'

class OwnedFlowersTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "each of the owned_flowers has an associated flower_type" do
    owned_flower_types = OwnedFlowers.all()
    owned_flower_types.each do |owned_flowers|
      assert_not_nil(owned_flowers.flower_type_id, "there is not an associated flower_type for all owned_flowers :(")
    end
  end

  test "there is not a negative quantity of owned_flowers" do
    owned_flower_types = OwnedFlowers.all()
    owned_flower_types.each do |owned_flowers|
      assert(owned_flowers.quantity >= 0, "there is a negative quantity of owned_flowers :(")
    end
  end

  test "ensure each flower_type has a quantity of owned_flowers" do
    flower_types = FlowerType.all()
    flower_types.each do |flower_type|
      assert_not_nil(OwnedFlowers.find_by_flower_type_id(flower_type.id), "this flower_type is not associated with a quantity of owned_flowers :(")
    end
  end

end
