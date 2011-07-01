class PagesController < ApplicationController
  def home
    if signed_in?
    @photos=College.find(current_user.college_id).photos.order("created_at DESC").page(params[:page]).per(20)
    end
  end

  def contact
  end

  def about
  end

end
