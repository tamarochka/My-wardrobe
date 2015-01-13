class Bottom < ActiveRecord::Base
  mount_uploader :pic, PicUploader
  has_many :outfits
  belongs_to :user

  validates :bottom_type, presence: true
  validates :color, presence: true
  validates :pic, presence: true

  paginates_per 6

  def name
    "#{self.color} #{self.bottom_type}"
  end
end
