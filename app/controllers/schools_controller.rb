class SchoolsController < ApplicationController
  def new
  end


  def show
    @school=School.find(params[:id])
    @photos=@school.photos.order("created_at DESC").page(params[:page]).per(20)
    @list=@school.name
  end
end

