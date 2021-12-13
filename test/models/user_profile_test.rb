require 'test_helper'

class UserProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "a user_profile's sun_penny quantity is greater than or equal to 0" do
    user_profiles = UserProfile.all()
    user_profiles.each do |user_profile|
      assert(user_profile.sun_penny >= 0, "a user_profile shouldn't be able to own a negative sun_penny quantity :(")
    end
  end

  test "a user_profile's last_update should not be before the game was created" do
    user_profiles = UserProfile.all()
    user_profiles.each do |user_profile|
      assert(user_profile.last_update > DateTime.new(2021,01,01,0,0,0).to_time, "a user_profile has a last_update time before the game was created :(")
    end
  end

end
