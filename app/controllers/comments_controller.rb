class CommentsController < ApplicationController
  before_action :authorize_user, only: [:create]

  def create
    @comment = Comment.new(comment_params)

    current_user.comments << @comment
    if @comment.save
      redirect_to @comment.meetup, notice: '创建评论成功！'
    else
      @meetup = @comment.meetup
      @comments = @meetup.comments.includes(:user).all
      render 'meetups/show'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :meetup_id)
    end
end
