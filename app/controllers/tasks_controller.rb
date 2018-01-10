class TasksController < ApplicationController  
  def index
    @tasks =Task.order(created_at: :desc)
    p @tasks
  end
    
  def edit
    @task =Task.find(params[:id])
    p @task
  end 

  def show
    @task =Task.find(params[:id])
    p @task
  end
      
  def new
    @task =Task.new
    p @task
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :line, :memo, :priority, :statusId, :labelId))
    p @task

    if @task.save
      flash[:noticeCreate] = t('flash.create')
      redirect_to tasks_path
    else
      render :new
    end
  end
    
  def update
    @task = Task.find(params[:id]) 
    p @task    
    @task.save
    if@task.update(params.require(:task).permit(:title, :line, :memo, :priority, :statusId, :labelId))
      flash[:noticeEdit] = t('flash.edit')
      redirect_to tasks_path
    else
      render :show
    end
  end
    
  def destroy
    @task = Task.find(params[:id])
    p @task  
    
    if @task.delete
      flash[:noticeDelete] = t('flash.delete')
      redirect_to tasks_path
    end
  end
end

  