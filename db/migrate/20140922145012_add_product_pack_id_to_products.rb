class AddProductPackIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_pack_id, :integer
    add_column :decors, :product_pack_id, :integer
    add_column :drink_sets, :product_pack_id, :integer
  end
end
