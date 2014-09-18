class AddPromotionIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :promotion_id, :integer
  end
end
