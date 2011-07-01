class PagesController < ApplicationController
  def home
    if signed_in?
    @photos=College.find(current_user.college_id).photos.page(params[:page]).per(1)
    end
  end

  def contact
  end

  def about
  end

end
