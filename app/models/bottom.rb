class Bottom < ActiveRecord::Base
  mount_uploader :pic, PicUploader
  has_many :outfits
  belongs_to :user

  validates :bottom_type, presence: true
  validates :color, presence: true
  validates :pic, presence: true

  def name
    "#{self.color} #{self.bottom_type}"
  end
end
