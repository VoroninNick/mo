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

  def contacts

  end

  def testing

  end
end
