class ProductController < ApplicationController

  def all_tablecloth
    @tablecloth = Category.where(:parent_id => true)
  end
  def one_item
    category = params[:category]
    sql = "select p.* from #{Category.table_name} c, #{Product.table_name} p where c.category_url = '#{category}' and p.category_id = c.id"

    sql_cat = 'SELECT  "categories".* FROM "categories"  WHERE "categories"."parent_id" = 1 '
    @categories = Category.find_by_sql(sql_cat)
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


  def all_sets
    @sets = DsCategory.where(:parent_id => nil)
  end

  def sets_category
    @all_category = DsCategory.where(:parent_id => nil).order('created_at DESC')
    @current_category = DsCategory.where(t_name: params[:category]).first

    category = params[:category]
    sql = "select p.* from #{DsCategory.table_name} c, #{DrinkSet.table_name} p where c.t_name = '#{category}' and p.ds_category_id = c.id"
    @products = DrinkSet.find_by_sql(sql)

  end

  def drink_set_detail
    parent_category = params[:category]
    product = params[:name]

    @parent = DsCategory.where(t_name: params[:category]).first

    query = "select p.* from #{DsCategory.table_name} c, #{DrinkSet.table_name} p where c.t_name = '#{parent_category}' and p.t_name = '#{product}'"
    result = ActiveRecord::Base.connection.execute( query )
    @product_one_item = []
    result.each do |row|
      @product_one_item.append( DrinkSet.find( row['id'] ) )
    end
    @product = @product_one_item.first

    query2 = "select pp.* from #{ProductPack.table_name} pp, #{DrinkSet.table_name} ds, set_packs sp where sp.drink_set_id = ds.id and sp.product_pack_id = pp.id and ds.id = #{@product.id}"
    # q = "select c.* from products p, collections c, products_collections_bind cp where cp.product_id = p.id and cp.collection_id = c.id and p.id = #{req_product}"
    result = ActiveRecord::Base.connection.execute( query2 )
    @product_pack_one_item = []
    result.each do |row|
      @product_pack_one_item.append( ProductPack.find( row['id'] ) )
    end

    @product_set = @product_pack_one_item.first

  end

  def all_decors
    @decors = DCategory.order('created_at DESC')
  end

  def decor_category
    @all_category = DCategory.order('created_at DESC')
    @current_category = DCategory.where(t_name: params[:category]).first

    category = params[:category]
    sql = "select p.* from #{DCategory.table_name} c, #{Decor.table_name} p where c.t_name = '#{category}' and p.d_category_id = c.id"
    @products = Decor.find_by_sql(sql)
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
