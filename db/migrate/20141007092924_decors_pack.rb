class DecorsPack < ActiveRecord::Migration
  def change
    create_table 'decor_packs' do |t|
      t.belongs_to :product_pack
      t.belongs_to :decor
    end
  end
end
