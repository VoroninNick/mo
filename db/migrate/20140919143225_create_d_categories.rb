class CreateDCategories < ActiveRecord::Migration
  def up
    create_table :d_categories do |t|
      t.string :name
      t.has_attached_file :icon
      t.integer :parent_id
      t.string :t_name

      t.timestamps
    end
    DCategory.create_translation_table! name: :string, t_name: :string
  end
  def down
    drop_table :d_categories
    DCategory.drop_translation_table!
  end
end
