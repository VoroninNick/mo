class AddProductIdToProductSet < ActiveRecord::Migration
  def change
    add_column :product_sets, :product_id, :integer
  end
end
