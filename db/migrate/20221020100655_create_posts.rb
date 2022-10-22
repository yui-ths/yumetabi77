class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :image
      t.string :image2
      t.string :image3
      t.text :body
      t.string :category
      t.string :address
      t.float :longitude
      t.float :latitude
      t.integer :user_id

      t.timestamps
    end
  end
end
