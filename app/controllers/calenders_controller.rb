class CalendersController < ApplicationController
  before_action :authenticate_user!

  def index
    @calenders = current_user.calenders
    @calender = Calender.new(owner_id: current_user.id)
  end

  def edit
    @calender = Calender.find(params[:id])
  end

  def update
    @calender = Calender.find(params[:id])
    if @calender.update_attributes(calender_params)
      flash[:success] = 'Calender updated'
      redirect_to root_url
    end
  end

  def create
    @calender = current_user.calenders.build(calender_params)
    if @calender.save
      flash[:success] = 'Calender created!'
      redirect_to root_url
    end
  end

  def destroy
    @calender = Calender.find(params[:id])
    @calender.destroy
    flash[:success] = 'Calender deleted'
  end

  private

  def calender_params
    params.require(:calender).permit(:title)
  end

end
