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



end
