class Top < ActiveRecord::Base
  mount_uploader :pic, PicUploader

  def name
    self.color + self.top_type
  end

end
