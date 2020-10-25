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

  def checked
    post = Post.find(params[:id])
    if post.checked
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id]) # 更新したレコードをitem = Post.find(params[:id])で取得し直し
    render json: { post: item } # JSON形式（データ）としてchecked.jsに返却
  end
end
