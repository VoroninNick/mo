class MainController < ApplicationController
  def index
    sql = 'SELECT  "categories".* FROM "categories"  WHERE "categories"."parent_id" = 1 '
    @category = Category.find_by_sql(sql)
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
    @sets = ProductPack.order('created_at ASC')
    @products = Product.where('promotion_price is not null').order('created_at ASC')
  end

  def ordering

  end
  
  def contacts
  end


  def testing

  end
end
