class EventsController < ApplicationController

  def index
    @events = Event.all
    # if params[:query].present?
    #   sql_subquery = <<~SQL
    #     events.title @@ :query
    #     OR events.description @@ :query
    #     OR stores.name @@ :query
    #   SQL
    #   @events = @events.joins(:store).where(sql_subquery, query: params[:query])
    # end
  end

  def show
    @event = Event.find(params[:id])
  end

end
