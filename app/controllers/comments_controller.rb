class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    if @comment.save
      respond_to do |format|
        format.js { render layout: false }
      end
    end
  end

  private
  def comment_params
    params[:comment].permit(
      :reply, :user_id
    )
  end
end