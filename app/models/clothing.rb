class Clothing < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user

  paginates_per 6

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
