class UsersController < ApplicationController
  
  
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  before_filter :authenticate, :except => [:show, :new, :create]
  
 
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @photos=@user.photos.order("created_at DESC").page(params[:page]).per(20)
    @list="My"
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
     @user = User.new(params[:user])
     if @user.save
       sign_in @user
       flash[:success] = "Welcome to College Collage!"
       redirect_to @user
     else
        if @user.errors.any?      
            errors="Please fix the error(s): <ul>"
            @user.errors.full_messages.each do |msg|
              errors<<"<il>" + msg +"</il><br>"
            end 
        end
        errors<<"</ul>"
        flash[:error]=errors.html_safe
       redirect_to signup_path
     end 
  end

  def update
         @user = User.find(params[:id])
         if @user.update_attributes(params[:user])
           flash[:success] = "Profile updated."
           redirect_to @user
         else
           render 'edit'
         end
  end

  def following
     @title = "Following"
     @user = User.find(params[:id])
     @users = @user.following.page(params[:page]).per(50)
     render 'show_follow'
   end
   
   def followers
       @title = "Followers"
       @user = User.find(params[:id])
       @users = @user.followers.page(params[:page]).per(50)
       render 'show_follow'
     end 


  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  private

     def authenticate
         deny_access unless signed_in?
     end
     
     def correct_user
          @user = User.find(params[:id])
          redirect_to(root_path) unless current_user?(@user)
     end
   
     def admin_user
           redirect_to(root_path) unless current_user.admin?
     end
    
end
