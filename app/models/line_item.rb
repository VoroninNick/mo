class LineItem < ActiveRecord::Base
  belongs_to :product
  attr_accessible :product
  belongs_to :decor
  attr_accessible :decor
  belongs_to :drink_set
  attr_accessible :drink_set
  attr_accessible :product_pack_id
  belongs_to :cart
  attr_accessible :quantity

  attr_accessible :p_drink_set_id, :p_product_id, :p_decor_id, :decor_quantity, :drink_set_quantity


  def increase_quantity count
    self.quantity = self.quantity + count.to_i
  end


end
