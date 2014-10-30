class LineItem < ActiveRecord::Base
  belongs_to :product
  attr_accessible :product
  belongs_to :product_pack
  attr_accessible :product_pack
  belongs_to :cart
  attr_accessible :quantity



  def increase_quantity count
    self.quantity = self.quantity + count.to_i
  end


end
