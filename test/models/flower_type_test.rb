require 'test_helper'

class FlowerTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "there are at least 3 flower_types" do
    counter = 0
    flower_types = FlowerType.all()
    flower_types.each do |flower_type|
      counter += 1
    end
    assert(counter >= 3, "there are insufficient flower_types :(")
  end

  test "a flower_type's growth_duration_seconds is greater than its max_water_interval" do
    flower_types = FlowerType.all()
    flower_types.each do |flower_type|
      assert(flower_type.growth_duration_seconds > flower_type.max_water_interval, "this flower_type has too long a max_water_interval :(")
    end
  end

  test "a flower_type's buy_price is less than its sell_price" do
    flower_types = FlowerType.all()
    flower_types.each do |flower_type|
      assert(flower_type.buy_price < flower_type.sell_price, "this flower_type shouldn't be bought for more than it's sold :(")
    end
  end

end
