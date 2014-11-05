class AddColumnsToLineItem < ActiveRecord::Migration
  def change
    add_reference :decors, index: true
    add_reference :drink_sets, index: true

    add_column :line_items, :decor_quantity, :integer
    add_column :line_items, :drink_set_quantity, :integer

    add_column :line_items, :p_drink_set_id, :integer
    add_column :line_items, :p_product_id, :integer
    add_column :line_items, :p_decor_id, :integer
  end
end
