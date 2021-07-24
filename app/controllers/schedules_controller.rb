class SchedulesController < ApplicationController
  def index
    @title = 'スケジューリング'
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @projects = @user.projects
    @work_target = WorkTarget.find(params[:work_target_id])
    @flags = @work_target.flags
    @tasks = Task.all

    #セレクトボックスの初期値設定
      @category_parent_array = ["---"]
    #データベースから親カテゴリーのみ抽出し、配列化
      #@projects.each do |project|
        #@category_parent_array << project
      #end
    gon.get_category_children = get_category_children_user_project_work_target_flag_schedules_path
    gon.get_grand_category_children = get_category_grandchildren_user_project_work_target_flag_schedules_path

    #gon.time = @task.assumptionCost
    #binding.pry
  end

  def new

  end

  def creat
    binding.pry
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Project.find(params[:parent_id]).work_targets
    render json: @category_children
  end
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @grand_category_children = WorkTarget.find(params[:child_id]).flags
    render json: @grand_category_children
  end
  def ajax
    @select_project = params[:project_id]
    @project = Project.find(params[:project_id])
    @child_worktargets = @project.work_targets
  end
  #親カテゴリーが選択された後に動くアクション
  
end
