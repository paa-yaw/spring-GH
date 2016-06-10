class Article < ActiveRecord::Base
  belongs_to :client
  validates :caption, :content, presence: true
  mount_uploader :caption_photo, CaptionPhotoUploader
end
