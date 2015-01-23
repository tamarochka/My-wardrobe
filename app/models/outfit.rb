class Outfit < ActiveRecord::Base
  belongs_to :top, :class_name => "Clothing"
  belongs_to :bottom, :class_name => "Clothing"
  belongs_to :shoe_pair, :class_name => "Clothing"
  belongs_to :user

  validates :bottom_id, presence: true
  validates :top_id, presence: true
  after_save :wear_outfit

  paginates_per 6

  def self.generate_random_hot(user)
    Outfit.new(top: clean_top_hot(user), bottom: clean_bottom_hot(user), shoe_pair: shoe_pair_hot(user))
  end

  def self.generate_random_cold(user)
    Outfit.new(top: clean_top_cold(user), bottom: clean_bottom_cold(user), shoe_pair: shoe_pair_cold(user))
  end


  def self.clean_top_cold(user)
    Clothing.clean.cold.random_top(user)
  end

  def self.clean_bottom_cold(user)
    Clothing.clean.cold.random_bottom(user)
  end

  def self.shoe_pair_cold(user)
    Clothing.cold.random_shoe_pair(user)
  end

  def self.clean_top_hot(user)
    Clothing.clean.hot.random_top(user)
  end

  def self.clean_bottom_hot(user)
    Clothing.clean.hot.random_bottom(user)
  end

  def self.shoe_pair_hot(user)
    Clothing.hot.random_shoe_pair(user)
  end

  def wear_outfit
    top.wear!
    bottom.wear!
  end

  def self.duplicate_check
    outfits = self.where("created_at >= ?", Time.zone.now.beginning_of_day)

    if outfits.count > 1

      @outfit_prev = Outfit.new

      outfits.each do |outfit|
        if outfit.bottom_id == @outfit_prev.bottom_id and outfit.top_id == @outfit_prev.top_id
          Outfit.find(@outfit_prev.id).destroy
        end
        @outfit_prev = outfit
      end
    end
  end

end
