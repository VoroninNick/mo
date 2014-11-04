class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include CurrentCart
  # before_action :create_cart
  #
  # def create_cart
  #   session[:cart]=Cart.create if session[:cart].blank?
  # end
  #
  # after_action :store_location
  #
  # def store_location
  #   session[:previous_url] = request.fullpath
  # end
  # before_action :create_cart
  #
  # def create_cart
  #   session[:cart_id]=Cart.create if session[:cart_id].blank?
  # end
  helper_method :current_cart
  def current_cart
    @current_cart ||= find_cart
  end

  def find_cart

    cart = Cart.find_by(id: session[:cart_id])

    unless  cart.present?
      cart = Cart.create
    end

    session[:cart_id] = cart.id
    cart
    # flash[:notice] = "Cart created"
  end
end
