class ProductsController < ApplicationController


  before_action :set_store, only: %i[new create edit update]
  before_action :set_product, only: %i[show edit update]

  # def index
  #   @products = Product.all
  # end


  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

# Parameters:

# {"authenticity_token"=>"[FILTERED]",
#  "product"=>{"name"=>"basket", "price"=>"1", "category"=>"", "stock"=>"", "discount"=>"", "event_ids"=>["", "12"], "description"=>""},
#  "commit"=>"Add/Edit",
#  "store_id"=>"31"}

  def create

    @product = Product.new(product_params)
    @product.store = @store

    if @product.save
      set_product_events(@product, params["product"]["event_ids"])
      redirect_to store_path(@store)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @product.update(product_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to store_path(@store)
  end

  private

  def set_product_events(product, event_ids)
    event_ids.reject(&:empty?).each do |event_id|
      EventProduct.create(product_id: product.id, event_id: event_id)
    end
  end

  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :category, :discount, :stock, :description, :event_ids)
  end

end
