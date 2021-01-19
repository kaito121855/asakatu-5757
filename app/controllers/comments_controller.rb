class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to tweet_path(comment.tweet.id), notice:"コメントしました"
    else
      @tweet = Tweet.find(params[:tweet_id])
      @comment = Comment.new
      @comments = @tweet.comments.includes(:user)
      flash.now[:notice] = "コメントに失敗しました"
      render template: 'tweets/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
