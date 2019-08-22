class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :prefecture
      t.string :brand
      t.string :image_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
