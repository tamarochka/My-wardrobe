class Clothing < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :outfits

  paginates_per 6

  def self.search(keywords)
    where("to_tsvector(clothing_type || ' ' || color || ' ' || clothing_style) @@ plainto_tsquery(?)", keywords)
  end

    # def available_styles
    # if type == "bottom"
    #   ["jeans", "shorts", "pants", "skirt"]
    # elsif type == "top"
    #   ["t-shirt", "dress shirt", "blouse", "sweater", "top"]
    # elsif type == "dress"
    #   ["..."]
    # else
    #   []
    # end
  # end

  def name
    "#{self.color} #{self.clothing_type} #{self.clothing_style}"
  end

  def wear!
    update(condition: "dirty")
  end

  def self.clean
    where(condition: "clean")
  end

  def self.random_top
    where(clothing_type: "Top").order("RANDOM()").first
  end

  def self.random_bottom
    where(clothing_type: "Bottom").order("RANDOM()").first
  end
end
