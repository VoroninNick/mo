class CreateProductSets < ActiveRecord::Migration
  def up
    create_table :product_sets do |t|
      t.string :name
      t.integer :percent
      t.boolean :is_active_set

      t.timestamps
    end
    ProductSet.create_translation_table! name: :string
  end
  def down
    drop_table :product_sets
    ProductSet.drop_translation_table!
  end
end
