class DisastersController < ApplicationController

  before_action :find_disaster, only: [:show, :edit]
  before_action :same_user, only: [:edit,:destroy]

  def index
   @disasters = Disaster.includes(:comments,:category,:user).page(params[:page])
  end

  def show

  end

  def new
    @disaster = Disaster.new
  end

  def create
    @disaster = current_user.disasters.new(disaster_params)
    if @disaster.save
      flash[:success] = "you have successfully created a post about disaster"
      redirect_to disasters_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if current_user.disasters.find(params[:id]).update(disaster_params)
      flash[:success] = "You have successfully updated your post"
      redirect_to disasters_path
    else
      render :edit
    end
  end

  def destroy
    current_user.disasters.find(params[:id]).destroy
    redirect_to disasters_path
  end

  private

  def same_user
    unless current_user.id == @disaster.user_id
      flash[:danger] = "You are not authorized to do that action"
      redirect_to disasters_path
    end
  end

  def disaster_params
    params.require(:disaster).permit(:title, :information, :category_id)
  end

  def find_disaster
    @disaster = Disaster.find(params[:id])
  end
end