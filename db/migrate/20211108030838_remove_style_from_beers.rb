class RemoveStyleFromBeers < ActiveRecord::Migration[6.1]
  def change
    remove_column :beers, :style, :string
  end
end
