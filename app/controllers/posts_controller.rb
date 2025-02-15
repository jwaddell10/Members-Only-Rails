class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to "/posts"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def post_params
      params.expect(post: [ :text ])
    end
end
