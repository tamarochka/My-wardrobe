class Clothing < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :outfits

  paginates_per 6

  def self.search(current_user, keywords)
    if keywords
      @clothings = current_user.clothings.where("color ILIKE ? OR clothing_type ilike ? OR clothing_style ilike ?", "%#{keywords}%", "%#{keywords}%", "%#{keywords}%")
    else
      @clothings = current_user.clothings.all
    end
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
end
