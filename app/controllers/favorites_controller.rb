class FavoritesController < ApplicationController
  
  def create
    @photo=Photo.find(params[:favorite][:photo_id]) if signed_in?
    current_user.favorite!(@photo)
    respond_to do |format|
      format.html { redirect_to @photo }
      format.js
    end
  end
  
  def destroy
    @photo = Photo.find(Favorite.find(params[:id]).photo_id)
    current_user.unfavorite!(@photo)
    respond_to do |format|
      format.html { redirect_to @photo }
      format.js
    end
  end
  
  def show
    if signed_in?
      photo_ids = %(SELECT photo_id FROM favorites
                        WHERE user_id = :user_id)
      @photos= Photo.where("id IN (#{photo_ids})",{ :user_id => current_user.id }).page(params[:page]).per(20)
      
      @list="Favorites"
    end
  end
  
  
 
  def self.followed_by(user)
      following_ids = %(SELECT followed_id FROM relationships
                        WHERE follower_id = :user_id)
      where("user_id IN (#{following_ids})",
            { :user_id => user })
  end
  
  
  
end
