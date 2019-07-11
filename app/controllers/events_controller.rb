class EventsController < ApplicationController
  before_action :authenticate_user!

  def new
    @calendar = current_user.calendars.find params[:calendar_id]
    @event = Event.new(calendar: @calendar, user: current_user)
  end

  def create
    @event = @current_calendar.events.build event_params
    if @event.save
      flash[:success] = 'Event created!'
      redirect_to root_url
    end
  end


  private

  def event_params
    params.require(:event).permit(:title, :location)
  end

end
