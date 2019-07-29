class EventsController < ApplicationController
  before_action :authenticate_user!, :load_calendar

  def index
    @events = @calendar.events
  end

  def new
    @event = Event.new(calendar: @calendar)
  end

  def create
    @event = @calendar.events.build event_params
    @event.user = current_user
    date_conversion()
    @event.save
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @calendar = current_user.calendars.find params[:calendar_id]
    @event = @calendar.events.find(params[:id])
  end

  def update
    @event = @calendar.events.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = 'Event updated'
    else
      flash[:error] = @event.errors.full_messages
      redirect_to edit_calendar_event_path(@calendar)
    end
  end

  def destroy
    @event = @calendar.events.find(params[:id])
    @event.destroy
    flash[:success] = 'Event deleted'
  end

  private

  def load_calendar
    @calendar = current_user.calendars.find params[:calendar_id]
  end

  def event_params
    params.require(:event).permit(:title, :start_time, :end_time, :color, :date_range)
  end

  def date_conversion
    start_time = params[:event][:start_time].split(' ')
    end_time = params[:event][:end_time].split(' ')
    date = params[:event][:date_range]
    str = date + ' ' + start_time[1]
    str2 = date + ' ' + end_time[1]
    @event.start_time = DateTime.strptime( str, '%m/%d/%Y %H:%M')
    @event.end_time = DateTime.strptime( str2, '%m/%d/%Y %H:%M')
  end

end
