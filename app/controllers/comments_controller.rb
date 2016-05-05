class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(allowed_params)
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to article_url(@comment.article_id)
    else
      render :new
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(allowed_params)
      flash[:notice] = "Successfully updated comment."
    
      redirect_to article_url(@comment.article_id)
    else
      render :edit
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully destroyed comment."
    
    redirect_to article_url(@comment.article_id)
  end
  
  private
  
  def allowed_params
    params.require(:comment).permit!
  end
end
