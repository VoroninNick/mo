class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

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
  before_action :create_cart

  def create_cart
    session[:cart_id]=Cart.create if session[:cart_id].blank?
  end
end
