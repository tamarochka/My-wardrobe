class Outfit < ActiveRecord::Base
  belongs_to :top
  belongs_to :bottom

  paginates_per 6

end
