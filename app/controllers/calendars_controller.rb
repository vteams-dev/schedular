class CalendarsController < ApplicationController
  before_action :authenticate_user!

  def index
    @calendars = current_user.calendars
    @calendar = Calendar.new(owner_id: current_user.id)
  end

  def show
    @calendar = Calendar.find(params[:id])
  end

  def edit
    @calendar = Calendar.find(params[:id])
  end

  def update
    @calendar = Calendar.find(params[:id])
    if @calendar.update_attributes(calendar_params)
      flash[:success] = 'Calendar updated'
      redirect_to root_url
    end
  end

  def create
    @calendar = current_user.calendars.build(calendar_params)
    if @calendar.save
      flash[:success] = 'Calendar created!'
      redirect_to root_url
    end
  end

  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy
    flash[:success] = 'Calendar deleted'
  end

  private

  def calendar_params
    params.require(:calendar).permit(:title)
  end

end
