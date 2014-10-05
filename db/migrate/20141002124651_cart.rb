class Cart < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.timestamps
    end
    create_table :line_items do |t|
      t.integer :cart_id
      t.integer :product_id
      t.integer :kit_id
      t.integer :quantity

      t.timestamps
    end
  end
end
