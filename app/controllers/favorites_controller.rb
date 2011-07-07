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
      @photos=current_user.favorites
      @list="Favorites"
    end
  end
  
end
