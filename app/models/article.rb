class Article < ActiveRecord::Base
  belongs_to :client

  mount_uploader :caption_photo, CaptionPhotoUploader
end
