class StoresController < ApplicationController
  def index

  end

  def show
    @store = Store.find(params[:id])

    @markers =
   [{
      lat: @store.latitude,
      lng: @store.longitude
      # info_window_html: render_to_string(partial: "info_window", locals: {flat: flat})
    }]


    @order = Order.find_by(user: current_user, store: @store, status_customer: "pending", status_store: "pending")
    unless @order
      @order = Order.create(user: current_user, store: @store, status_customer: "pending", status_store: "pending")
    end
  end
end
