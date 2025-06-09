class StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
    @order = Order.find_by(user: current_user, store: @store, status_customer: "pending", status_store: "pending")
    unless @order
      @order = Order.create(user: current_user, store: @store, status_customer: "pending", status_store: "pending")
    end
  end
end
