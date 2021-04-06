class CreateBeers < ActiveRecord::Migration[6.1]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :type
      t.float :abv
      t.integer :ibu
      t.integer :brewery_id

      t.timestamps
    end
  end
end
