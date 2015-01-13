class Top < ActiveRecord::Base
  mount_uploader :pic, PicUploader
  has_many :outfits
  belongs_to :user

  validates :top_type, presence: true
  validates :color, presence: true
  validates :pic, presence: true

  def name
    "#{self.color} #{self.top_type}"
  end
end
