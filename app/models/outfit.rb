class Outfit < ActiveRecord::Base
  belongs_to :top, :class_name => "Clothing"
  belongs_to :bottom, :class_name => "Clothing"
  belongs_to :shoe_pair, :class_name => "Clothing"
  belongs_to :user

  after_save :wear_outfit

  paginates_per 6

  def self.generate_random_hot
    Outfit.new(top: clean_top_hot, bottom: clean_bottom_hot, shoe_pair: shoe_pair_hot)
  end

  def self.generate_random_cold
    Outfit.new(top: clean_top_cold, bottom: clean_bottom_cold, shoe_pair: shoe_pair_cold)
  end


  def self.clean_top_cold
    Clothing.clean.cold.random_top
  end

  def self.clean_bottom_cold
    Clothing.clean.cold.random_bottom
  end

  def self.shoe_pair_cold
    Clothing.cold.random_shoe_pair
  end

  def self.clean_top_hot
    Clothing.clean.hot.random_top
  end

  def self.clean_bottom_hot
    Clothing.clean.hot.random_bottom
  end

  def self.shoe_pair_hot
    Clothing.hot.random_shoe_pair
  end

  def wear_outfit
    top.wear!
    bottom.wear!
  end
end
