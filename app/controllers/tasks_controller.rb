class TasksController < ApplicationController
  def index
    @tasks =Task.all
    priority = ["高","中","低"]

    if params[:sort]==('priority')
      @tasks = Task.order(params[:sort]) #余裕があればソート順の指定
      p priority
    else
      @tasks = Task.order(params[:sort])
    end

    if params[:commit]=="SEARCH_TITLE"
      @tasks =Task.all
      @tasks = Task.where(title: params[:titleWord]) #検索時に追加
    end
    if params[:commit]=="SEARCH_STATUS"
      @tasks =Task.all
      @tasks = Task.where(status: params[:statusWord]) #検索時に追加
    end
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
    @task = Task.new(params.require(:task).permit(:title, :line, :memo, :priority, :status, :labelId))
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
    if@task.update(params.require(:task).permit(:title, :line, :memo, :priority, :status, :labelId))
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

