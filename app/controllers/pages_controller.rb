class PagesController < ApplicationController
  def home
    if signed_in?
    @photos=College.find(current_user.college_id).photos
    end
  end

  def contact
  end

  def about
  end

end
