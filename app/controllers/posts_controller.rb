class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "ASC")
  end

  # def new
  # end

  def create
    Post.create(content: params[:content])
    redirect_to action: :index
  end

end
