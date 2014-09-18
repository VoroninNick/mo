class ProductController < ApplicationController
  def all_tablecloth

  end

  def one_item
    # sql = 'SELECT  "categories".* FROM "categories"  WHERE "categories"."parent_id" = 1 '
    # @category = Category.find_by_sql(sql)
    @one_item = Product.order('created_at ASC')
  end
end
