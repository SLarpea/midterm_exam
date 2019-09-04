class CommentsController < ApplicationController

  before_action :find_disaster, only: [:create, :destroy]

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.disaster = @disaster
    if @comment.save
      redirect_to disaster_path(@disaster)
    else
      redirect_to disaster_path(@disaster)
    end
  end

  def destroy
    current_user.comments.find(params[:id]).destroy
    redirect_to disaster_path(@disaster)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_disaster
    @disaster = Disaster.find(params[:disaster_id])
  end

end
