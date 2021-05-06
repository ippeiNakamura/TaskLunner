class TasksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @work_target = WorkTarget.find(params[:work_target_id])
    @flag = Flag.find(params[:flag_id])
    @tasks = @flag.tasks
    @assumptionTotalCost = @tasks.sum(:assumptionCost)
    @assumptionday = (@assumptionTotalCost / 7).ceil
    @completionDate = @assumptionday.business_days.from_now.to_time
    @releaseDate = Time.now
    @progress = progress(@completionDate,@releaseDate)
    if params[:format]
      #binding.pry
      @title_text = "サブタスク"
    else
      @task = Task.new
      @title_text = "タスク"
    end
  end

  def new
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @work_target = WorkTarget.find(params[:work_target_id])
    @flag = Flag.find(params[:flag_id])
    if params[:format]
      #binding.pry
      @task = Task.find(params[:format]).children.new(task_params) 
      @title_text = "サブタスク"
    else
      @task = Task.new
      @title_text = "タスク"
    end

  end

  def create
    binding.pry
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @work_target = WorkTarget.find(params[:work_target_id])
    @flag = Flag.find(params[:flag_id])
    if @task
      @task = Task.find(params[:format]).children.new(task_params) 
    else
      @task = Task.new(task_params)
    end

    if @task.save!
      redirect_to user_project_work_target_flag_tasks_path,notice:"正常に登録されました。"
    else
      flash.now[:alert] = "登録できませんでした。"  
    end
  end
 
  def edit
  end

  def update
    #binding.pry

  end

  def show
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @work_target = WorkTarget.find(params[:work_target_id])
    @flag = Flag.find(params[:flag_id])
    @task = Task.find(params[:id])
    @task_child = Task.find(params[:id]).children
    #binding.pry
    if params[:id]
      @title_text = "サブタスク"
    else
      @title_text = "タスク"
    end
  end

  def destroy
  end
  def sub_task_create
    binding.pry
  end
  private def task_params
    params.require(:task).permit(
      :name,
      :assumptionCost,
      :memo
    )
  end
  private def progress(completionDate,releaseDate)
    if completionDate <= releaseDate
      @progress = "予定通り"
    else
      #binding.pry
      @progress = (completionDate.to_date - releaseDate.to_date).to_i.to_s + "日遅れ"
    end
  end
end
