class CreateWarranties < ActiveRecord::Migration
  def up
    create_table :warranties do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.boolean :published

      t.timestamps
    end
    Warranty.create_translation_table! name: :string, slug: :string, description: :text
  end
  def down
    drop_table :warranties
    Warranty.drop_translation_table!
  end
end
