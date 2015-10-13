class MainController < ApplicationController
  def index
    # sql = 'SELECT  "categories".* FROM "categories"  WHERE "categories"."parent_id" = 1 '
    # @category = Category.find_by_sql(sql)
    @categories = Category.where(parent_id: '1').includes(:products)
    @publication = Publication.where(selected_article: true).order("created_at DESC").limit(4)
    @promotion = Promotion.where(selected_promotion: true).order('created_at ASC').first
  end

  def all_publication
    @publication = Publication.order('created_at DESC')
  end

  def one_article
    @one_item = Publication.find_by_url(params[:url])
  end

  def special_offers
    @sets = ProductPack.order('created_at ASC').where(published: 1)
    @products = Product.where('promotion_price is not null').order('created_at ASC')
  end

  def ordering

  end
  
  def contacts
  end


  def testing

  end

  def customized_form
    first_name = params[:firstname]
    last_name = params[:lastname]
    phone = params[:phone]
    email = params[:email]
    message = params[:message]
    CustomizedForm.send_customized_data(first_name, last_name, phone, email, message).deliver
  end

  def call_order
    first_name = params[:firstname]
    last_name = params[:lastname]
    phone = params[:phone]
    CustomizedForm.send_call_order_data(first_name, last_name, phone).deliver
  end

  def contact_form
    first_name = params[:firstname]
    last_name = params[:lastname]
    phone = params[:phone]
    email = params[:email]
    message = params[:message]
    CustomizedForm.send_contact_form_data(first_name, last_name, phone, email, message).deliver
  end

  def order_product
    first_name = params[:firstname]
    last_name = params[:lastname]
    phone = params[:phone]
    email = params[:email]
    message = params[:message]
    cart = params[:cart_id]
    total_price = params[:total_price]
    method_payment = params[:method_payment]
    city  = params[:city]
    department  = params[:department]

    CustomizedForm.order_product_data(first_name, last_name, phone, email, message, cart, total_price, method_payment, city, department).deliver
  end

end
