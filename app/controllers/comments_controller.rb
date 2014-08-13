class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id ])
    @comment = @post.comments.create!(comment_params)
    respond_to do |format|
      format.html {redirect_to @post}
      format.js {render :template => 'comments/create.js'}
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:post_id, :body)
  end
end
