class ProjectsController < ApplicationController
  before_action :find_user
  include FlashMessage

  def index
    @projects = @user.projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = @user.id
    #FlashMessage.save_data_message(@project)
  end
  
  def edit
    test
  end

  def update
  end

  def show
  end

  def destroy
  end

  private
    def find_user
      @user = User.find(params[:user_id])
    end
    def project_params
      params.require(:project).permit(:name)
    end
end
