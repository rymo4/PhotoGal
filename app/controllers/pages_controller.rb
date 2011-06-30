class PagesController < ApplicationController
  def home
    @photos=College.find(current_user.college_id).photos
  end

  def contact
  end

  def about
  end

end
