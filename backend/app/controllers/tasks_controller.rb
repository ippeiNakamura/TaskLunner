  class TasksController < ApplicationController
    #before_action :initial_model
    def index
      @user = User.find(params[:user_id])
      @tasks = Task.all
      @assumption_total_Cost = assumption_total_Cost(@tasks)
      @assumptionday = assumptionday(@assumption_total_Cost)
      @finishDay = finish_day(@assumptionday)
      @startDay = Date.current - 3
      @releaseDate = @user.releaseDate   
      @completeTaskCost = complete_task_cost(@tasks)
      @uncompleteTaskCost = uncomplete_task_cost(@tasks)
      @limitDate = limit_date(@releaseDate)
      @per1DayScheduleProgress = per1day_schedule_progress(@uncompleteTaskCost,@limitDate)
      @scheduleProgress = (Date.current - @startDay).to_i * @per1DayScheduleProgress
      @progress = progress(@scheduleProgress,@completeTaskCost)

      #user_tasks = user.projects.includes(work_targets: [flags: :tasks])
      #render json: [tasks:tasks,assumptionTotalCost:assumption_total_Cost(tasks)]
    end

    def new
      @user = User.find(params[:user_id])
      task_category_colection
      @task = Task.new
      @before_request = request.referer
    end

    def create
      task_category
      if @task_category == "タスク"
        @task = Task.new(task_params) #タスクのインスタンス
      else
        @task = @parent_task.children.new(task_params) #サブタスクのインスタンス
      end
      if @task.save
        parent_assumptioncost(@task)
        flash[:notice] =  @task.name  + 'を追加しました'
      else
        flash[:alert] =  @task.name  + 'を追加できませんでした'
      end
  
      redirect_to params[:task][:before_request]
    end

    def update
      task_category
      @task = Task.find(params[:id])
      @task.assign_attributes(task_params)
      if @task.save
        parent_assumptioncost(@task)
        #assumptionCost = ancestor.children.sum(:assumptionCost)
        flash[:notice] =  @task.name  + 'を編集 しました'
      else
        flash[:alert] =  @task.name  + 'を編集できませんでした'
      end
      redirect_to request.referer
    end

    def show
    end

    def destroy
      @task = Task.find(params[:id])      
      if @task.destroy
        flash[:notice] =  @task.name  + 'を削除しました'
      else
        flash[:alert] =  @task.name  + 'を削除できませんでした'
      end
      redirect_to request.referer
    end
    
    #####################プライベート######################################################
    private 
      def task_params
        params.require(:task).permit(:name,:assumptionCost,:memo,:status).merge(flag_id:params[:flag_id])
      end
      def initial_model
        @flag = Flag.find(params[:flag_id])
      end

      #想定合計工数の算出
      def assumption_total_Cost(tasks)
          @assumptionTotalCost = tasks.sum(:assumptionCost)
      end

      #想定日数の算出
      def assumptionday(assumptionTotalCost)
        @assumptionday = (assumptionTotalCost / 7).ceil
      end
      
      #完了予定日
      def finish_day(assumptionDay)
        Date.today + assumptionDay
      end
      
      #進捗の算出
      def progress(scheduleProgress,completeTaskCost)
       @progress = completeTaskCost - scheduleProgress
        if @progress >= 0 
          @progress = @progress.to_s + "時間分予定より先に進んでいます！"
        else
          @progress = @progress.abs.to_s + "時間分予定より遅れています！"
        end  
      end
      
      #残日数
      def limit_date(releaseDate)
        @limit_date = (releaseDate - Date.current).to_i  
      end

      #完了タスク工数
      def complete_task_cost(tasks)
        @completeTaskCost = tasks.where(status:"完了").sum(:assumptionCost)
      end

      #未完了タスク工数
      def uncomplete_task_cost(tasks)
        @uncompleteTaskCost = tasks.where.not(status:"完了").sum(:assumptionCost)
      end

      #１日あたりの予定進捗工数
      def per1day_schedule_progress(uncompleteTaskCost,limitDate)
       @per1DayScheduleProgress = uncompleteTaskCost / limitDate
      end
      
        def task_category_colection
        if params[:format]
          @task_category = "サブタスク"
          @task = Task.find(params[:format])
          @tasks = @task.children #サブタスクの取得
          #@title = @task.name
          @parent_id = @task.id
        else
          @task_category = "タスク"
          @tasks = @user.tasks.where(parent_id: nil) #親タスクのみ取得(子を持たない)
          #@title = Flag.find(params[:flag_id]).name
        end
      end

      def task_category
        if params[:task][:parent_id] == "" #子を持たないタスクの場合
          @task_category = "タスク"
          #@tasks = @flag.tasks
          #@title = User.find(params[:flag_id]).name
        else  #子を持つタスクの場合
          @task_category = "サブタスク"
          @parent_task = Task.find(params[:task][:parent_id])
          @tasks = @parent_task.children
          @title = @parent_task.name
        end
      end
      
      #想定工数を"hh:mm:ss"形式に変換
      def ssumptioncost_to_time 
        Time.at(task.assumptionCost * 60).utc.strftime('%X')
      end

      #親タスクの想定工数算出
      def parent_assumptioncost(task)
        ancestorIdList = [] #先祖IDのリスト化
        Task.each_with_level(@task.ancestors) do |ancestor| #先祖タスクを繰り返し
          ancestorIdList = ancestorIdList.unshift(ancestor.id) #先祖のIDを格納
        end
        ancestorIdList.each do |id| #子から先祖に向かって繰り返す
          task = Task.find(id) #タスクの取得
          task.update(assumptionCost: task.children.sum(:assumptionCost)) #タスクの想定工数を、子タスクの想定工数の合計に変更
        end
      end
      
      def redirect(task)
        if !(task.parent_id == "") 
          @task = task.parent 
        else
          @task = ''
        end
        #タスク一覧へリダイレクト
        if task.save! 
          redirect_to user_project_work_target_flag_tasks_path(@user,@project,@work_target,@flag,@task), notice:"正常に登録されました。"
        else
          redirect_to user_project_work_target_flag_tasks_path(@user,@project,@work_target,@flag,@task), notice:"登録できませんでした。"
        end        
      end

    

  end
