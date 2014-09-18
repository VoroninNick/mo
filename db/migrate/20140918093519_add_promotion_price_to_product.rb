class AddPromotionPriceToProduct < ActiveRecord::Migration
  def change
    add_column :products, :promotion_price, :float
  end
end
