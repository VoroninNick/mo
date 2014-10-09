class ProductController < ApplicationController
  def all_tablecloth
    @tablecloth = Category.where(:parent_id => true)
  end
  def all_sets
    @sets = DsCategory.where(:parent_id => nil)
  end
  def all_decors
    @decors = DCategory.order('created_at DESC')
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

    @parent = Category.find_by_category_url(params[:category])

    # variant 2 for create obj product
    query = "select p.* from #{Category.table_name} c, #{Product.table_name} p where c.category_url = '#{category}' and p.t_name = '#{product}'"
    result = ActiveRecord::Base.connection.execute( query )
    @product_one_item = []
    result.each do |row|
      @product_one_item.append( Product.find( row['id'] ) )
    end
    @product = @product_one_item.first

    # create product pack object
    query2 = "select pc.* from #{ProductPack.table_name} pc, #{Product.table_name} p where p.product_pack_id = pc.id and p.id = #{@product.id}"
    result = ActiveRecord::Base.connection.execute( query2 )
    @product_pack_one_item = []
    result.each do |row|
      @product_pack_one_item.append( ProductPack.find( row['id'] ) )
    end

    @product_set = @product_pack_one_item.first
  end

  def drink_set_detail
    parent_category = params[:category]
    children_category = params[:subcategory]
    product = params[:name]

    @parent = DsCategory.find_by_t_name(params[:category])
    query = "select p.* from #{DsCategory.table_name} c, #{DrinkSet.table_name} p where c.t_name = '#{children_category}' and p.t_name = '#{product}'"
    result = ActiveRecord::Base.connection.execute( query )
    @product_one_item = []
    result.each do |row|
      @product_one_item.append( DrinkSet.find( row['id'] ) )
    end
    @product = @product_one_item.first


    query2 = "select pc.* from #{ProductPack.table_name} pc, #{DrinkSet.table_name} p where p.product_pack_id = pc.id and p.id = #{@product.id}"
    result = ActiveRecord::Base.connection.execute( query2 )
    @product_pack_one_item = []
    result.each do |row|
      @product_pack_one_item.append( ProductPack.find( row['id'] ) )
    end

    @product_set = @product_pack_one_item.first
  end

  def decor_detail
    parent_category = params[:category]
    product = params[:name]

    @parent = DCategory.find_by_t_name(params[:category])
    query = "select p.* from #{DCategory.table_name} c, #{Decor.table_name} p where c.t_name = '#{parent_category}' and p.t_name = '#{product}'"
    result = ActiveRecord::Base.connection.execute( query )
    @product_one_item = []
    result.each do |row|
      @product_one_item.append( Decor.find( row['id'] ) )
    end
    @product = @product_one_item.first


    query2 = "select pc.* from #{ProductPack.table_name} pc, #{Decor.table_name} p where p.product_pack_id = pc.id and p.id = #{@product.id}"
    result = ActiveRecord::Base.connection.execute( query2 )
    @product_pack_one_item = []
    result.each do |row|
      @product_pack_one_item.append( ProductPack.find( row['id'] ) )
    end

    @product_set = @product_pack_one_item.first
  end
end
