class AddKeywordsToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :keywords, :string
  end
end
