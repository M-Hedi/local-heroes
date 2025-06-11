class ItemsController < ApplicationController
  def create
    puts params.inspect
    order_id = params[:item][:order_id]
    product_id = params[:item][:product_id]
    @order = Order.find(order_id)
    @product = Product.find(product_id)

    if Item.exists?(order: @order, product: @product)
      @item = Item.find_by(order: @order, product: @product)
      @item.quantity += 1
      @item.save
      respond_to do |format|
      format.json do
        render json: {
          cart_html: render_to_string(partial: "shared/cart", locals: { order: @order }, formats: [:html]),
          quantity_html: render_to_string(partial: "shared/product_quantity", locals: { item: @item }, formats: [:html])
        }
      end
      format.html { head :ok }
      end
    else
      @item = Item.create(order: @order, product: @product, quantity: 1)
      respond_to do |format|
        format.json do
          render json: {
            cart_html: render_to_string(partial: "shared/cart", locals: { order: @order }, formats: [:html]),
            quantity_html: render_to_string(partial: "shared/product_quantity", locals: { item: @item }, formats: [:html])
          }
        end
        format.html { head :ok }
      end
    end
  end

  def update
    @item = Item.find(params[:id])
    case params[:operation]
    when "increase"
      @item.quantity += 1
      @item.save
    when "decrease"
      @item.quantity += -1
      @item.save
    end

    @order = @item.order
    @order.reload

    respond_to do |format|
      format.json do
        render json: {
          cart_html: render_to_string(partial: "shared/cart", locals: { order: @item.order }, formats: [:html]),
          quantity_html: render_to_string(partial: "shared/product_quantity", locals: { item: @item }, formats: [:html])
        }
      end
      format.html { head :ok }
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.json do
        render json: {
          cart_html: render_to_string(partial: "shared/cart", locals: { order: @item.order }, formats: [:html]),
          button_html: render_to_string(partial: "shared/add_to_cart", locals: { product: @item.product }, formats: [:html])
        }
      end
      format.html { head :ok }
    end
  end
end
