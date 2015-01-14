class Outfit < ActiveRecord::Base
  belongs_to :top
  belongs_to :bottom

  has_many :clothings

  paginates_per 6

end
