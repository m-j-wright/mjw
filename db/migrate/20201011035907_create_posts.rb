class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :content
      t.text :title
      t.string :tag
      t.string :image
      t.string :mood
      t.integer :comments_count

      t.timestamps
    end
  end
end
