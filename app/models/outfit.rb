class Outfit < ActiveRecord::Base
  belongs_to :top, :class_name => "Clothing"
  belongs_to :bottom, :class_name => "Clothing"
  belongs_to :user

  after_save :wear_outfit

  paginates_per 6

  def self.generate_random
    Outfit.new(top: clean_top, bottom: clean_bottom)
  end

  def self.clean_top
    Clothing.clean.random_top
  end

  def self.clean_bottom
    Clothing.clean.random_bottom
  end

  def wear_outfit
    top.wear!
    bottom.wear!
  end

  # #update one week old outfit condition
  # outfit_to_clean = Outfit.where("created_at = ?", 1.week.ago.utc)
  # if outfit_to_clean.any?
  #   outfit_to_clean[0].top.update(:condition => "clean")
  #   outfit_to_clean[0].bottom.update(:condition => "clean")
  # end
end
