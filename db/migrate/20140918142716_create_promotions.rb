class CreatePromotions < ActiveRecord::Migration
  def up
    create_table :promotions do |t|
      t.string :title
      t.has_attached_file :image
      t.string :t_title
      t.boolean :selected_promotion

      t.timestamps
    end
    Promotion.create_translation_table! title: :string
  end
  def down
    drop_table :promotions
    Promotion.drop_translation_table!
  end
end
