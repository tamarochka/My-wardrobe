class Bottom < ActiveRecord::Base
  mount_uploader :pic, PicUploader
  has_many :outfits
  belongs_to :user
end
