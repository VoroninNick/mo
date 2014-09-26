class AddDecorIdDrinkSetIdToProductSet < ActiveRecord::Migration
  def change
    add_column :decors, :decor_id, :integer
    add_column :drink_sets, :drink_set_id, :integer
  end
end
