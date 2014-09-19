class CreateDsCategories < ActiveRecord::Migration
  def up
    create_table :ds_categories do |t|
      t.string :name
      t.has_attached_file :icon
      t.integer :parent_id
      t.string :t_name

      t.timestamps
    end
    DsCategory.create_translation_table! name: :string, t_name: :string
  end
  def down
    drop_table :ds_categories
    DsCategory.drop_translation_table!
  end
end
