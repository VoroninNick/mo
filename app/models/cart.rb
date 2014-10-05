class Cart < ActiveRecord::Base
  has_many :line_items
end
class LineItem < ActiveRecord::Base
  def total_price
    product.price * quantity
  end
end