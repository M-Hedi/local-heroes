class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @event = Event.all
    @stores = Store.all
  end
end
