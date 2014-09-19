class CreateDrinkSets < ActiveRecord::Migration
  def up
    create_table :drink_sets do |t|
      t.string :name
      t.string :t_name
      t.has_attached_file :image
      t.integer :count_items
      t.float :price
      t.float :new_price
      t.text :short_description
      t.text :description
      t.integer :ds_category_id

      t.timestamps
    end
    DrinkSet.create_translation_table! name: :string, t_name: :string, short_description: :text, description: :text
  end
  def down
    drop_table :drink_sets
    DrinkSet.drop_translation_table!
  end
end
