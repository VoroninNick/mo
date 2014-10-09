class LineItem < ActiveRecord::Base
  belongs_to :product
  attr_accessible :product
  belongs_to :product_pack
  attr_accessible :product_pack
  belongs_to :cart
end
