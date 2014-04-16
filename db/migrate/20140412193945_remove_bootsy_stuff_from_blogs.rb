class RemoveBootsyStuffFromBlogs < ActiveRecord::Migration
  def change
	remove_column :blogs, :bootsy_image_gallery_id, :integer
  end
end
