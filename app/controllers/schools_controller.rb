class SchoolsController < ApplicationController
  def new
  end


  def show
    @school=School.find(params[:id])
    @photos=School.find(@school.id).photos
  end
end

