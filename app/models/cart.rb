class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :delete_all

  def self.destroy_cart
    Cart.expired.delete_all
    # @carts = Cart.where("updated_at < #{24.hours.ago}")
    # @carts.delete_all
  end
  scope :expired, -> { where('created_at <= ?', 1.minute.ago) }

  after_save do
    Cart.destroy_cart
  end
end
