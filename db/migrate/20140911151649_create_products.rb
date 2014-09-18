class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string :name
      t.has_attached_file :image
      t.float :price
      t.integer :count_items
      t.text :short_description
      t.text :description
      t.integer :category_id

      t.timestamps
    end
  Product.create_translation_table! :name => :string, :short_description => :text, :description => :text
  end
  def down
    drop_table :products
    Product.drop_translation_table!
  end
end
