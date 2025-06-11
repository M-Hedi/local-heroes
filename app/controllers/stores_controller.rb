class StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])

    @stores = Store.all
    @markers = @stores.geocoded.map do |store|
    {
      lat: @store.latitude,
      lng: @store.longitude,
      info_window_html: render_to_string(partial: "shared/info_window", locals: {store: store})
    }
  end

    @order = Order.find_by(user: current_user, store: @store, status_customer: "pending", status_store: "pending")
    unless @order
      @order = Order.create(user: current_user, store: @store, status_customer: "pending", status_store: "pending")
    end
  end
end
