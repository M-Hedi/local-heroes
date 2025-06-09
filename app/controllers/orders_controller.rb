class OrdersController < ApplicationController

  def index
    @orders = Order.all
    @orders_pending = Order.where(status_store: "pending")
    @orders_accepted = Order.where(status_store: "accepted")
    @orders_refused = Order.where(status_store: "refused")
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
    return if Order.exists?(user: current_user, store: Store.find(params[:store_id]))
    @order = Order.create(user: current_user, store: Store.find(params[:store_id]), status_customer: "pending", status_store: "pending")
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
