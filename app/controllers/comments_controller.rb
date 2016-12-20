class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def create
    Comment.create(content: params[:comment],user_id: session[:user_id],place_id:params[:id])
    redirect_to(:back)
  end

  def show
   @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def destroy
    Comment.destroy(params['id'])
    redirect_to(:back)
  end

  def update

  end

end
