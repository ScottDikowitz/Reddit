class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    render :show
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.sub_id = params[:sub_id]
    if @post.save
      render :show
    else
      flash.now[:error] = @post.errors.full_messages
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
      render :show
    else
      flash.now[:error] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to subs_url
  end

  def post_params
    params.require(:post).permit(:title, :url, :content)
  end
end
