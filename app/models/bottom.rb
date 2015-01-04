class Bottom < ActiveRecord::Base
  mount_uploader :pic, PicUploader
  has_many :outfits
  belongs_to :user

  def name
    "#{self.color} #{self.bottom_type}"
  end
end
