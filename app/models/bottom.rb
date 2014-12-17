class Bottom < ActiveRecord::Base
  mount_uploader :pic, PicUploader
end
