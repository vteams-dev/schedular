class EventsController < ApplicationController
  before_action :authenticate_user!


  def index
    @calendar = current_user.calendars.find params[:calendar_id]
    @events = @calendar.events
  end

  def new
    @calendar = current_user.calendars.find params[:calendar_id]
    @event = Event.new(calendar: @calendar)
  end

  def create
    @calendar = current_user.calendars.find params[:calendar_id]
    @event = @calendar.events.build event_params
    @event.user = current_user
    if @event.save
      flash[:success] = 'Event created!'
      redirect_to calendar_events_path
    else
      flash[:alert] = @event.errors.full_messages
      redirect_to new_calendar_event_path(@calendar)
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @calendar = current_user.calendars.find params[:calendar_id]
    @event = @calendar.events.find(params[:id])
  end

  def update
    @calendar = current_user.calendars.find params[:calendar_id]
    @event = @calendar.events.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = 'Event updated'
      redirect_to calendar_event_path(@calendar, @event.id)
    else
      flash[:error] = @event.errors.full_messages
      redirect_to edit_calendar_event_path(@calendar)
    end
  end

  def destroy
    @calendar = current_user.calendars.find params[:calendar_id]
    @event = @calendar.events.find(params[:id])
    @event.destroy
    flash[:success] = 'Event deleted'
    redirect_to calendar_events_path(@calendar)
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_time, :end_time)
  end

end
