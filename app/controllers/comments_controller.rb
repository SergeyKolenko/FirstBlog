class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id ])
    @comment = @post.comments.create!(comment_params)
    # puts '----' * 10
    # puts params.inspect
    # puts '----' * 10
    # redirect_to post_comment_path(@post.id, @comment.id)
     respond_to do |format|
       format.html {redirect_to @post}
       format.js
     end
  end


  private

  def comment_params
    params.require(:comment).permit(:post_id, :body)
  end
end
