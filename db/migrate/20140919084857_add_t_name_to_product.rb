class AddTNameToProduct < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.string :t_name
    end
    change_table Product.translation_class.table_name do |t|
      t.string :t_name
    end
  end
end
