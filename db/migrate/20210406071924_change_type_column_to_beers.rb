class ChangeTypeColumnToBeers < ActiveRecord::Migration[6.1]
  def change
    change_table :beers do |t|
      t.rename :type, :style
    end
  end
end
