require 'test_helper'

class PlotSlotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "all plot_slots' x and y values are within range" do
    plot_slots = PlotSlot.all()
    plot_slots.each do |plot_slot|
      assert(plot_slot.x >= 0, "this plot_slot's x value is negative :(")
      assert(plot_slot.y >= 0, "this plot_slot's y value is negative :(")
      assert(plot_slot.x < 3, "this plot_slot's x value is out of bounds :(")
      assert(plot_slot.y < 3, "this plot_slot's y value is out of bounds :(")
    end
  end

  test "all plot_slots are first planted then watered" do
    plot_slots = PlotSlot.all()
    plot_slots.each do |plot_slot|
      assert(plot_slot.when_planted <= plot_slot.when_watered, "this plot_slot was watered before it was planted :(")
    end
  end

end
