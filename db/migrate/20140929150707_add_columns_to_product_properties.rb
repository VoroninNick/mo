class AddColumnsToProductProperties < ActiveRecord::Migration
  def change
    add_column :product_properties, :characteristic_id, :integer
    add_column :product_properties, :characteristic_type, :string
  end
end
