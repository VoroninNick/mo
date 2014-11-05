class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]


  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
    # flash[:notice] = "Line item created"
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    if params[:product_pack_id] == nil
      product = Product.find(params[:product_id])

      @existed_item = @cart.line_items.where(product_id: product.id)
      if @existed_item.count > 0
        @line_item = @existed_item.first
        if @line_item && !@line_item.quantity
          @line_item.quantity = 0
        end
        @line_item.increase_quantity(params[:quantity])
      else
        @line_item = @cart.line_items.build(product: product, quantity: params[:quantity])
      end
    else
      @line_item = @cart.line_items.build( p_drink_set_id: params[:p_drink_set_id], product_pack_id: params[:product_pack_id], p_product_id: params[:p_tablecloth_id], p_decor_id: params[:p_decor_id])
    end

    flash[:notice] = "Thank you for add this product"
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart,
                                    notice: 'Line item was successfully created.' }
        format.json { render action: 'show',
                             status: :created, location: @line_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @line_item.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    # item = params[:line_item_id]
    # @item_for_delete = @cart.line_items.destroy(item)

    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :product_pack_id, :cart_id, :p_drink_set_id, :p_product_id, :p_decor_id, :decor_id, :drink_set_id )
    end
end
