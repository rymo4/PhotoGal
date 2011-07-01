class SchoolsController < ApplicationController
  def new
  end


  def show
    @school=School.find(params[:id])
    @photos=@school.photos.page(params[:page]).per(3)
  end
end

