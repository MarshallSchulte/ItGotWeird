class AddBootsyImageGalleryIdToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :bootsy_image_gallery_id, :integer
  end
end
