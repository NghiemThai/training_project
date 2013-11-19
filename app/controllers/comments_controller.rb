class CommentsController < ApplicationController
  before_action :signed_in_user

  def create
    @comment = current_user.comments.build(comment_params)
    @comment[:entry_id] = params[:entry_id]
    @comment[:user_id] = current_user[:id]
    
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to entry_path(params[:entry_id])
    else
      flash[:error] = "Please fill your comment"
      redirect_to entry_path(params[:entry_id])
    end
    
  end

  def destroy
  end
  
  private

    def comment_params
      params.require(:comment).permit(:content)
    end
  
end