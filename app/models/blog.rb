class Blog < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  mount_uploader :image, ImageUploader
  
  default_scope -> { order('created_at DESC') }
end
