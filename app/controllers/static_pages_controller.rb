class StaticPagesController < ApplicationController
   #skip_before_action :authenticate_user!, only: [:home]
   before_action :authenticate_user!
  def home
     @calender = ''  #current_user.calenders.build
  end
end
