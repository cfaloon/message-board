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
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post successfully created!'
    else
      render :new, error: @post.errors
    end
  end

  private

  # parameter sanitizer
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
