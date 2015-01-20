class Clothing < ActiveRecord::Base
  attr_reader :validate_minimum_image_size
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :outfits

  validates :clothing_type, :color, :image, presence: true
  validate :validate_minimum_image_size, on: :create

  paginates_per 6

  def validate_minimum_image_size
    unless image.blank?
      image = MiniMagick::Image.open(self.image.path.to_s)
      unless image[:width] > 299 && image[:height] > 299
        errors.add :image, "should be 300x300px minimum!"
      end
    end
  end

  def self.search(keywords)
    where("to_tsvector(clothing_type || ' ' || color || ' ' || clothing_style) @@ plainto_tsquery(?)", keywords)
  end

  def name
    "#{self.color} #{self.clothing_style}"
  end

  def wear!
    update(condition: "dirty")
  end

  def self.dirty
    where(condition: "dirty")
  end

  def self.clean
    where(condition: "clean")
  end

  def self.cold
    where(weather: ["Cold", "Any"])
  end

  def self.hot
    where(weather: ["Hot", "Any"])
  end

  def self.random_top
    where(clothing_type: "Top").order("RANDOM()").first
  end

  def self.random_shoe_pair
    where(clothing_type: "Shoes").order("RANDOM()").first
  end

  def self.random_bottom
    where(clothing_type: "Bottom").order("RANDOM()").first
  end
end
