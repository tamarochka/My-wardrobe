class Outfit < ActiveRecord::Base
  belongs_to :top
  belongs_to :bottom

end
