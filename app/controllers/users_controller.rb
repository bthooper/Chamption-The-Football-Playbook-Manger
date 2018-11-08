class UsersController < ApplicationController
  
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]


  def new
    @user = User.new
    @user.profile = Profile.new
  end

  def create
    @user = User.new(user_params(:name, :email, :nickname, :password, profile_attributes: [:role, :nickname]))
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    if params[:id].to_i == current_user.id 
      @user = current_user 
    else
      redirect_to current_user 
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find_by(id: params[:id])
    @user.update(user_params(:name, :email, :nickname, profile_attributes: [:role, :nickname]))
    redirect_to user_path @user 
  end

  def index
    @users = User.all
  end


  private

  def user_params(*args)
      params.require(:user).permit(*args)
  end

  def require_login
    return head(:forbidden) unless logged_in?
  end

  
end
