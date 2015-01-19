class CreatePayments < ActiveRecord::Migration
  def up
    create_table :payments do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.boolean :published

      t.timestamps
    end
    Payment.create_translation_table! name: :string, slug: :string, description: :text
  end
  def down
    drop_table :payments
    Payment.drop_translation_table!
  end
end
