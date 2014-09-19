class AddProductSetIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :product_set_id, :integer
  end
end
