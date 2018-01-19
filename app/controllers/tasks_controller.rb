class TasksController < ApplicationController
  PER = 6

  def index
    priority = %w[高 中 低]
    if params[:commit] == 'SEARCH_TITLE'
      @tasks = Task.where(title: params[:titleWord]).where(userId: session[:id]).page(params[:page]).per(PER) # pagination #タイトル検索
    elsif params[:commit] == 'SEARCH_STATUS'
      @tasks = Task.where(status: params[:statusWord]).where(userId: session[:id]).page(params[:page]).per(PER) # pagination #ステータス検索
    elsif params[:commit] == 'SEARCH_LABEL'
      @tasks = Task.where("(label1 = ?) OR (label2 = ?)", params[:labelWord], params[:labelWord]).where(userId: session[:id]).page(params[:page]).per(PER) # pagination #ステータス検索
    elsif params[:sort] == 'priority' # 優先度
      @tasks = Task.order(params[:sort]).where(userId: session[:id]).page(params[:page]).per(PER) # pagination #余裕があればソート順の指定
    elsif params[:sort] == 'line' # 締め切り
      @tasks = Task.order(params[:sort]).where(userId: session[:id]).page(params[:page]).per(PER) # pagination
    elsif params[:sort] == 'created_at DESC' # 登録日
      @tasks = Task.order(params[:sort]).where(userId: session[:id]).page(params[:page]).per(PER) # pagination
    else
      @tasks = Task.where(userId: session[:id]).page(params[:page]).per(PER) # pagination
    end
  end

  def edit
    @task = Task.find(params[:id])
    p @task
  end

  def show
    @task = Task.find(params[:id])
    p @task
  end

  def new
    @task = Task.new
    p @task
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :line, :memo, :priority, :status, :label1, :label2 ,:userId))
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
    if @task.update(params.require(:task).permit(:title, :line, :memo, :priority, :status,  :label1, :label2, :userId))
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
