class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.all
  end

  def my_posts
    @posts = current_user.posts
  end

  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render new_post_path
    end
  end

  def show;end

  private
  def post_params
    params[:post].permit(
      :company_name, :description, :recommendation, :user_id
    )
  end

  def set_post
    @post = Post.find_by(id: params[:id])
  end
end