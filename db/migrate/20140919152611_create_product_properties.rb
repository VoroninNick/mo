class CreateProductProperties < ActiveRecord::Migration
  def up
    create_table :product_properties do |t|
      t.string :pp_key
      t.string :pp_value
      t.boolean :is_active_property

      t.timestamps
    end
    ProductProperty.create_translation_table! pp_key: :string, pp_value: :string
  end
  def down
    drop_table :product_properties
    ProductProperty.drop_translation_table!
  end
end
