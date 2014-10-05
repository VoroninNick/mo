class LineItemsController < ActionController::Base
  def add_product
    @line_item = LineItem.new
    @line_item.cart_id = session[:cart].id
    @line_item.product_id = params[:product_id]
    @line_item.quantity = 1
    @line_item.save!
    redirect_to session[:previous_url]
  end

  def destroy_product
    cart_id = params[:cart_id]
    product_id = params[:product_id]

    LineItem.delete_all(cart_id: cart_id, product_id: product_id)

    respond_to do |format|
      format.json { head :no_content }
      # render :nothing => true
      # format.html { render nothing: true }
    end
  end

  def  del_all
    cart_id = params[:cart_id]
    LineItem.delete_all(cart_id: cart_id)
    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
