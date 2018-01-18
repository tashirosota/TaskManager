class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  # GET /users.json
  def index
    if session[:userrole] == 'admin'
      @users = User.all
      @tasks = Task.all
    else
      redirect_to root_path
    end
  end

  def certification
    @user = User.find_by(name: params[:user][:name], pass: params[:user][:pass])

    if @user.nil?
      redirect_to root_path
    else
      session[:id] = @user.id
      session[:username] = @user.name
      session[:userrole] = @user.role
      redirect_to tasks_path
    end
  end

  def sign_in
    @user = User.new
  end

  # GET /users/1
  # GET /users/1.json
  def show;
    per = 10
    @tasks = Task.where(userId: params[:id]).page(params[:page]).per(per)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params.require(:user).permit(:name, :pass, :role))

    respond_to do |format|
      if @user.save
        if session[:username]=="admin"
          format.html { redirect_to admin_users_url, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { redirect_to root_path, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        end
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if User.where(role: 'admin').count==1&&@user.role=='admin'
        format.html { redirect_to admin_users_url, notice: 'User wasn\'t successfully updated.' }
        format.json { render :show, status: :ok, location: @user }

      else
        if @user.update(params.require(:user).permit(:name, :pass, :role))
          format.html { redirect_to admin_users_url, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }

        end
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy

    if User.where(role: 'admin').count==1 && @user.role==('admin')
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'User wasn\'t successfully destroyed.' }
        format.json { head :no_content }
      end

    else
      @tasks = Task.where(userId: params[:id])
      @tasks.each do |task|
        task.destroy
      end

      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :pass)
  end
end
