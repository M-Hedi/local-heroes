class StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])

    @markers = [current_user, @store].map do |point|
    {
      lng: point.longitude,
      lat: point.latitude,
      info_window_html: render_to_string(partial: "shared/info_window", locals: {point: point}),
      is_user_store: current_user.store && point.id == current_user.store.id || point.id === current_user.id
    }
  end

    @order = Order.find_by(user: current_user, store: @store, status_customer: "pending", status_store: "pending")
    unless @order
      @order = Order.create(user: current_user, store: @store, status_customer: "pending", status_store: "pending")
    end
  end
end
