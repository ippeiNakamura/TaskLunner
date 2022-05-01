class UsersController < ApplicationController
  def index
    
  end
  def new
  end

  def create
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes({releaseDate: params[:user][:releaseDate]})
    if @user.save
      flash[:notice] =  'リリース日を更新しました'
    else
      flash[:alert] =  'リリースを更新できませんでした'
    end
    redirect_to request.referer
  end

  def show
    @user = User.find(params[:id])
    @project = @user.projects.find(4)
    @work_target = @project.work_targets.find(2)
  end

  def destroy
  end
end
