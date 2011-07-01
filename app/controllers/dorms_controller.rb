class DormsController < ApplicationController
  def new
  end
  
  def show
    if signed_in?
    @dorm=Dorm.find(params[:id])
    @photos=@dorm.photos.order("created_at DESC").page(params[:page]).per(20)
  
    end
  end

end
