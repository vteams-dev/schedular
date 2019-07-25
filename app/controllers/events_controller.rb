class EventsController < ApplicationController
  before_action :authenticate_user!, :load_calendar

  def index
    @events = @calendar.events
  end

  def new
    @event = Event.new(calendar: @calendar)
  end

  def create
    if params[:event][:repeat] == '1'
      if params[:event][:repeat_type] == 'monthly'
        @event = @calendar.events.build event_params
        @event.user = current_user
        for i in 1...params[:event][:repeat_value].to_i
          @new_event = @event.dup
          @new_event.start_time = @event.start_time + i.months
          @new_event.end_time = @event.end_time + i.months
          @new_event.save
        end
        if @event.save
          flash[:success] = 'Event created!'
          redirect_to calendar_events_path(@calendar)
        else
          flash[:alert] = @event.errors.full_messages
          redirect_to new_calendar_event_path(@calendar)
        end
      elsif params[:event][:repeat_type] == 'weekly'
        @event = @calendar.events.build event_params
        @event.user = current_user
        for i in 1...params[:event][:repeat_value].to_i
          @new_event = @event.dup
          @new_event.start_time = @event.start_time + i*7.days
          @new_event.end_time = @event.end_time + i*7.days
          @new_event.save
        end
        if @event.save
          flash[:success] = 'Event created!'
          redirect_to calendar_events_path(@calendar)
        else
          flash[:alert] = @event.errors.full_messages
          redirect_to new_calendar_event_path(@calendar)
        end
      elsif params[:event][:repeat_type] == 'yearly'
        @event = @calendar.events.build event_params
        @event.user = current_user
        for i in 1...params[:event][:repeat_value].to_i
          @new_event = @event.dup
          @new_event.start_time = @event.start_time + i.years
          @new_event.end_time = @event.end_time + i.years
          @new_event.save
        end
        if @event.save
          flash[:success] = 'Event created!'
          redirect_to calendar_events_path(@calendar)
        else
          flash[:alert] = @event.errors.full_messages
          redirect_to new_calendar_event_path(@calendar)
        end
      elsif params[:event][:repeat_type] == 'daily'
        @event = @calendar.events.build event_params
        @event.user = current_user
        for i in 1...params[:event][:repeat_value].to_i
          @new_event = @event.dup
          @new_event.start_time = @event.start_time + i.days
          @new_event.end_time = @event.end_time + i.days
          @new_event.save
        end
        if @event.save
          flash[:success] = 'Event created!'
          redirect_to calendar_events_path(@calendar)
        else
          flash[:alert] = @event.errors.full_messages
          redirect_to new_calendar_event_path(@calendar)
        end
      end
    elsif params[:event][:repeat] == '0'
      @event = @calendar.events.build event_params
      @event.user = current_user
      if @event.save
        flash[:success] = 'Event created!'
        redirect_to calendar_events_path(@calendar)
      else
        flash[:alert] = @event.errors.full_messages
        redirect_to new_calendar_event_path(@calendar)
      end

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
    @event = @calendar.events.find(params[:id])
    @event.destroy
    flash[:success] = 'Event deleted'
    redirect_to calendar_events_path(@calendar)
  end

  private

  def load_calendar
    @calendar = current_user.calendars.find params[:calendar_id]
  end

  def event_params
    params.require(:event).permit(:title, :start_time, :end_time, :repeat, :repeat_value, :repeat_type)
  end

end
