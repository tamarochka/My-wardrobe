class Top < ActiveRecord::Base
  mount_uploader :pic, PicUploader
end
