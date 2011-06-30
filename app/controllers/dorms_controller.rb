class DormsController < ApplicationController
  def new
  end
  
  def show
    @dorm=Dorm.find(params[:id])
    @photos=Dorm.find(@dorm.id).photos
  end

end
