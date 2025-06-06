class OrdersController < ApplicationController

def index
  @orders = Order.all
  @orders_pending = Order.where(status_store: "pending")
  @orders_accepted = Order.where(status_store: "accepted")
  @orders_refused = Order.where(status_store: "refused")
  @orders_pending_count = @orders_pending.count
  @orders_accepted_count = @orders_accepted.count
  @orders_refused_count = @orders_refused.count
  @order = Order.find(67)
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

def add_product
  @item = Item.find(params[:id])
  @item.quantity += 1
  if @item.save
    redirect_to orders_path, notice: "Produit ajouté à la commande !"
  else
    redirect_to orders_path, alert: "Erreur lors de l'ajout du produit."
  end
end


end
