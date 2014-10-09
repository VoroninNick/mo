class SetsPack < ActiveRecord::Migration
  def change
    create_table 'set_packs' do |t|
      t.belongs_to :product_pack
      t.belongs_to :drink_set
    end
  end
end
