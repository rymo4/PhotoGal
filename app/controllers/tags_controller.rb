class TagsController < ApplicationController
  def new
   
  end
  
  def create
  end
  
  def show
    if signed_in?
      @tag=Tag.find(params[:id])
      @photos=College.find(current_user.college_id).photos.where(:tag_id=>@tag.id).page(params[:page]).per(20)
      @list=@tag.name
    end
  end
  
end
