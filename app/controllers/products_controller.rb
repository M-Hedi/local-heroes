class ProductsController < ApplicationController
  
  
  before_action :set_store, only: %i[new create edit update]
  before_action :set_product, only: %i[show edit update]

  # def index
  #   @products = Product.all
  # end


  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.store = @store
    if @product.save
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

  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :category, :discount, :stock, :description)
  end

end
