class CommentsController < ApplicationController
 
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html 
      
    end
  end

 
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html 
     
    end
  end

  def new
    @comment = Comment.new

    respond_to do |format|
      format.html 
      
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end

 
  def create
    if signed_in?
      @photo=Photo.find(params[:photo_id])
      @comment = Comment.new(:comment=>params[:comment][:comment], :user_id=>current_user.id, :photo_id=>Photo.find(params[:photo_id]).id)

      respond_to do |format|
        if @comment.save
          format.html { redirect_to(@photo) }
        
          format.html { render :action => "new" }
       
        end
      end
    end
  end

  
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@comment, :notice => 'Comment was successfully updated.') }
       
      else
        format.html { render :action => "edit" }
        
      end
    end
  end

  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @photo=Photo.find(@comment.photo_id)
    respond_to do |format|
      format.html { redirect_to(@photo) }
    
    end
  end
end
