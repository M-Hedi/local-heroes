require 'ostruct'
class SearchesController < ApplicationController

  # def index
  #   @events = Event.all
  #   if params[:query].present?
  #     sql_subquery = <<~SQL
  #       events.title @@ :query
  #       OR events.description @@ :query
  #       OR stores.name @@ :query
  #     SQL
  #     @events = @events.joins(:store).where(sql_subquery, query: params[:query])
  #   end

  #   @stores = Store.all
  #   if params[:query].present?
  #     sql_subquery = <<~SQL
  #       stores.name @@ :query
  #       OR stores.category @@ :query
  #     SQL
  #     @stores = @stores.joins(:event).where(sql_subquery, query: params[:query])
  #   end
  # end

  def index
    if params[:query].present?
      @stores = Store.search_by_name_and_category(params[:query])
      @events = Event.search_by_title_and_description(params[:query])
      # Pour fusionner les résultats dans un seul tableau :
      @results = (@stores + @events)
    else
      @stores = Store.first(3)
      @events = Event.first(3)
      @results = (@stores + @events)
    end
  end
end
