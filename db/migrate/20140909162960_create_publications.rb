class CreatePublications < ActiveRecord::Migration
  def up
    create_table :publications do |t|
      t.string :title
      t.string :author
      t.text :short_description
      t.text :description
      t.has_attached_file :image
      t.boolean :selected_article
      t.string :url

      t.timestamps
    end
  Publication.create_translation_table! :title => :string, :author => :string, :short_description => :text, :description => :text
  end
  def down
    drop_table :publications
    Publication.drop_translation_table!
  end
end
