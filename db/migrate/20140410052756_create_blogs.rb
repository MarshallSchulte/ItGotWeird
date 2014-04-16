class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.integer :userId
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
