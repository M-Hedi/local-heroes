class OrdersController < ApplicationController

  def index
    @orders = Order.where(store: current_user.store)
    @orders_pending = Order.where(store: current_user.store, status_store: "pending")
    @orders_accepted = Order.where(store: current_user.store, status_store: "accepted")
    @orders_refused = Order.where(store: current_user.store, status_store: "refused")
    @orders_pending_count = @orders_pending.count
    @orders_accepted_count = @orders_accepted.count
    @orders_refused_count = @orders_refused.count
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status_customer: params[:status_customer])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render json: { redirect_url: root_path } }
    end
  end

  def accepted
    @order = Order.find(params[:id])
    @order.update(status_store: "accepted")
    redirect_to orders_path, notice: "Commande validée !"
  end

  def refused
    @order = Order.find(params[:id])
    @order.update(status_store: "refused")
    redirect_to orders_path, notice: "Commande refusée !"
  end

  def create
  store = Store.find(params[:store_id])
  @order = Order.find_or_create_by(user: current_user, store: store) do |order|
    order.status_customer = "pending"
    order.status_store = "pending"
  end

  respond_to do |format|
    format.json { render json: { order_id: @order.id } }
  end
end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def index_baskets
    @orders = Order.where(user: current_user)
    @orders_baskets_valides = Order.where(user: current_user, status_customer: "validated")
    @orders_pending_accepted = Order.where(user: current_user, status_store: "accepted", status_customer: "validated")
    @orders_baskets_valides_count = @orders_baskets_valides.count
    @orders_pending_accepted_count = @orders_pending_accepted.count
    @orders_baskets_refused = Order.where(user: current_user, status_store: "refused", status_customer: "validated")
    @orders_baskets_refused_count = @orders_baskets_refused.count
  end
end
