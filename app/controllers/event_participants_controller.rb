class EventParticipantsController < ApplicationController
  def create
    EventParticipant.create(user: current_user, event: Event.find(params[:event_id]))
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def destroy
    @participant = EventParticipant.find_by(user: current_user, event: Event.find(params[:event_id]))
    @participant.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
