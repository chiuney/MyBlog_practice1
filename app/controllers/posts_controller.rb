class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end

  def index
    @post = Post.all.order(id: "DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render "posts/new"
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render "posts/new"
    end
  end

  def destroy
    @post = Post.find(params[:id])
  end

    private

    def post_params
      params.require(:post).permit(:title, :content)
    end

end
