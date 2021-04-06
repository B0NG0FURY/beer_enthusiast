class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :beer_id
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
