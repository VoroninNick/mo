class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.string :name
      t.has_attached_file :icon
      t.has_attached_file :image
      t.integer :parent_id
      t.string :category_url

      t.timestamps
    end
    Category.create_translation_table! name: :string, category_url: :string
  end
  def down
    drop_table :categories
    Category.drop_translation_table!
  end
end
