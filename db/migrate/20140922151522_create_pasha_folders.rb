class CreatePashaFolders < ActiveRecord::Migration
  def change
    create_table :pasha_folders do |t|
      t.string :name

      t.text :content

      t.timestamps
    end

    PashaFolder.create_translation_table!
  end
end
