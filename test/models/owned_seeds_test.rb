require 'test_helper'

class OwnedSeedsTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "each of the owned_seeds has an associated flower_type" do
    owned_seed_types = OwnedSeeds.all()
    owned_seed_types.each do |owned_seeds|
      assert_not_nil(owned_seeds.flower_type, "there is not an associated flower_type for all owned_seeds :(")
    end
  end

  test "there is not a negative quantity of owned_seeds" do
    owned_seed_types = OwnedSeeds.all()
    owned_seed_types.each do |owned_seeds|
      assert(owned_seeds.quantity >= 0, "there is a negative quantity of owned_seeds :(")
    end
  end

  test "ensure each flower_type has a quantity of owned_seeds" do
    flower_types = FlowerType.all()
    flower_types.each do |flower_type|
      assert_not_nil(OwnedSeeds.find_by_flower_type_id(flower_type.id), "this flower_type is not associated with a quantity of owned_seeds :(")
    end
  end

end
