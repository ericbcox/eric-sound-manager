class CreatePosts < ActiveRecord::Migration
  def change
    drop_table :posts
    create_table :posts do |t|
      t.string :name
      t.string :format
      t.integer :length
      t.integer :size

      t.timestamps
    end
  end
end
