class PlayBrick < ActiveRecord::Base
  belongs_to :users
  belongs_to :users
  mount_uploader :image, ImageUploader
end
