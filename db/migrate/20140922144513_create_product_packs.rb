class CreateProductPacks < ActiveRecord::Migration
  def up
    create_table :product_packs do |t|
      t.string :name
      t.integer :percent
      t.string :slug
      t.boolean :published

      t.timestamps
    end
    ProductPack.create_translation_table! name: :string, slug: :string
  end
  def down
    drop_table :product_packs
    ProductPack.drop_translation_table!
  end
end
