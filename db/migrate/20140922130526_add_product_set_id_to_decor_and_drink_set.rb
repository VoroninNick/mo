class AddProductSetIdToDecorAndDrinkSet < ActiveRecord::Migration
  def change
    add_column :decors, :product_set_id, :integer
    add_column :drink_sets, :product_set_id, :integer
  end
end
