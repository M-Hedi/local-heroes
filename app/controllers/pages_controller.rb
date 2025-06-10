class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @product = Product.last
  end

  def dashboard
    @user = current_user || User.find(params[:id])
    @orders_pending = Order.where(user: current_user, status_store: "pending")
    @orders_accepted = Order.where(user: current_user, status_store: "accepted")
    @orders_refused = Order.where(user: current_user, status_store: "refused")
    @orders_pending_count = @orders_pending.count
    @orders_accepted_count = @orders_accepted.count
    @orders_refused_count = @orders_refused.count
    @confirmation_rate = @orders_accepted_count.to_f / (@orders_accepted_count + @orders_pending_count) * 100
  end

end
