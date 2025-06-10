class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update]

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
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event), notice: "Événement créé avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :end_date, :store_id, :photo)
  end



end
