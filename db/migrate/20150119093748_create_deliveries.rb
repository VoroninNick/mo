class CreateDeliveries < ActiveRecord::Migration
  def up
    create_table :deliveries do |t|
      t.string :name
      t.string :slug
      t.boolean :published
      t.text :description

      t.timestamps
    end
    Delivery.create_translation_table! name: :string, slug: :string, description: :text
  end
  def down
    drop_table :deliveries
    Delivery.drop_translation_table!
  end
end
