class DormsController < ApplicationController
  def new
  end
  
  def show
    if signed_in?
    @dorm=Dorm.find(params[:id])
    @photos=@dorm.photos.page(params[:page]).per(1)
  
    end
  end

end
