class PostsController < ApplicationController
  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to subs_url
    else
      fail
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  private
  def post_params
    parameters = params.require(:post).permit(:title, :url, :content, sub_ids: [])
    #sub_ids is an array, calls sub_ids method, permit blank array
    parameters[:user_id] = current_user.id
    parameters
  end
end
