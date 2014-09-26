class CreatePashaFiles < ActiveRecord::Migration
  def change
    create_table :pasha_files do |t|
      t.text :content
      t.string :name
      t.belongs_to :pasha_folder

      t.timestamps
    end
  end
end
