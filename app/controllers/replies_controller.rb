class RepliesController < ApplicationController
  before_action :authenticate_user!, on: [:new, :create]
  before_action :set_post

  # GET /posts/:post_id/replies/new
  def new 
    @reply = Reply.new
  end

  # POST /posts/:post_id/replies
  def create
    new_reply_params = reply_params.merge(post_id: params[:post_id], user_id: current_user.id)
    @reply = Reply.new(new_reply_params)
    if @reply.save
      redirect_to @post, notice: 'Reply successfully added!'
    else
      redirect_to new_post_reply(@post), alert: 'Reply content was empty!'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
    
  def reply_params
    params.require(:reply).permit(:user_id, :post_id, :content)
  end
end
