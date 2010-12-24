class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    if @comment.valid?
      flash[:notice] = "comment created"
    else
      flash[:notice] = @comment.errors
    end
    redirect_to post_path(@post) # redirect_to 不可以 用 Model validate errors , 必须用 render ,但是 这里 是 跳转到 Post#show 所以 勉强 用 notice 吧
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
  
end
