class OrdersController < ApplicationController

def index
  @orders = Order.all
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
