class ProductController < ApplicationController
  def all_tablecloth

  end

  def one_item
    category = params[:category]
    sql = "select p.* from #{Category.table_name} c, #{Product.table_name} p where c.category_url = '#{category}' and p.category_id = c.id"

    @parent = Category.find_by_category_url(params[:category])
    @products = Product.find_by_sql(sql)
  end
  def product_detail
    category = params[:category]
    product = params[:name]
    sql = "select p.* from #{Category.table_name} c, #{Product.table_name} p where c.category_url = '#{category}' and p.t_name = '#{product}'"

    @parent = Category.find_by_category_url(params[:category])
    @product = Product.find_by_sql(sql).first
  end
end
