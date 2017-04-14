class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  # GET /posts/new
  def new
    @post = Post.new(user_id: current_user.id)
  end

  # GET /posts/:id
  def show
    @post = Post.find(params[:id])
  end
  
  # POST /posts
  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))
    if @post.save
      redirect_to @post, notice: 'Post successfully created!'
    else
      redirect_to new_post_url, alert: @post.errors
    end
  end

  private

  # parameter sanitizer
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
