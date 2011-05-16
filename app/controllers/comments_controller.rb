class CommentsController < ApplicationController
  def show
    @comments=Comment.find_all_by_article_id(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def create
    @new_comment = Comment.new
    @new_comment.comment=params[:comment]
    @new_comment.article_id=params[:id]
    if not session[:user_name]
      @new_comment.user_name = 'anonymous'
      @new_comment.user_photo_url = '/images/nobody.png'
    end
    @new_comment.save
    @comments=Comment.find_all_by_article_id(params[:id])
    respond_to do |format|
      format.html
    end
  end

end
