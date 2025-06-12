class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @user = current_user
    @stores = Store.all
    @markers = @stores.geocoded.map do |store|
      {
        lat:store.latitude,
        lng:store.longitude,
        info_window_html: render_to_string(partial: "shared/info_window", locals: {point: store}),
        is_user_store: store.id == current_user.store.id
    }
    end
  end

  def dashboard
    @user = current_user || User.find(params[:id])
    @orders_pending = Order.where(store: current_user.store, status_store: "pending")
    @orders_accepted = Order.where(store: current_user.store, status_store: "accepted")
    @orders_refused = Order.where(store: current_user.store, status_store: "refused")
    @orders_pending_count = @orders_pending.count
    @orders_accepted_count = @orders_accepted.count
    @orders_refused_count = @orders_refused.count
    @confirmation_rate = @orders_accepted_count.to_f / (@orders_accepted_count + @orders_pending_count) * 100
    @my_events = Event.where(store: current_user.store)
    @my_products = Product.where(store_id: current_user.store.id)
  end

end
