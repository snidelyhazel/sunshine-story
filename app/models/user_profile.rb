class UserProfile < ApplicationRecord
  # https://guides.rubyonrails.org/active_record_validations.html#validation-helpers

  validates_presence_of :user_name
  # https://stackoverflow.com/a/23935712
  # validates_format_of :user_name, :with => /\A((?!(fuck|shit|damn|ass|cunt|fag|)).)*\z/i

  # Alternative ways to handle filtering banned words:
  # https://github.com/chrisvfritz/language_filter
  # https://github.com/hairyhum/bad-words.ruby
  # https://rubygems.org/gems/bad_word_detector/versions/0.0.1
  # https://rubygems.org/gems/profanity-filter/versions/1.0
  # https://github.com/OpenGems/polite_text

  validates_presence_of :sun_penny
  validates_numericality_of :sun_penny, :greater_than_or_equal_to => 0

  validates_presence_of :last_update
  validate :last_update_after_game_created

  def last_update_after_game_created
    if last_update < DateTime.new(2021,01,01,0,0,0)
      errors.add :last_update, "last_update must be after game created"
    end
  end

  # Gem to handle validation of Date, Time, and DateTime objects in Ruby
  # https://github.com/adzap/validates_timeliness

  validates_presence_of :plot_size
  validates_numericality_of :plot_size, :greater_than_or_equal_to => 3

end
