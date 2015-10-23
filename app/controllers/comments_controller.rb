class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = Comment.new(comments_params)
    @comment.author_id = current_user.id
    if @comment.save
      redirect_to "/.."
    else
      raise "You suck!!!!!!!!"
    end
  end

  def comments_params
    params.require(:comment).permit(:content, :post_id)
  end
end
