class DormsController < ApplicationController
  def new
  end
  
  def show
    if signed_in?
    @dorm=Dorm.find(params[:id])
    @photos=Dorm.find(@dorm.id).photos
    end
  end

end
