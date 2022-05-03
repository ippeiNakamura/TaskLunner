class UsersController < ApplicationController
  def index
    
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "新規登録が完了しました"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @user = User.new(params[:id])
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

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
