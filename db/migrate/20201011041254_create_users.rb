class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :is_private
      t.string :username
      t.text :bio
      t.string :image
      t.integer :blogs_count

      t.timestamps
    end
  end
end
