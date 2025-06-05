class SearchesController < ApplicationController

  def index
    @events = Event.all
    if params[:query].present?
      sql_subquery = <<~SQL
        events.title @@ :query
        OR events.description @@ :query
        OR stores.name @@ :query
      SQL
      @events = @events.joins(:store).where(sql_subquery, query: params[:query])
    end

    @stores = Store.all
    if params[:query].present?
      sql_subquery = <<~SQL
        stores.name @@ :query
        OR stores.category @@ :query
      SQL
      @stores = @stores.joins(:event).where(sql_subquery, query: params[:query])
    end
  end

end
