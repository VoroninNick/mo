class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def self.destroy_cart
    Cart.expired.destroy_all
    # @carts = Cart.where("updated_at < #{24.hours.ago}")
    # @carts.delete_all
  end
  scope :expired, -> { where('created_at <= ?', 24.hours.ago) }

  after_save do
    Cart.destroy_cart
  end
end
