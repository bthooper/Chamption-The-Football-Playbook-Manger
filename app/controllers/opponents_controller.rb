class OpponentsController < ApplicationController

  before_action :require_login

  def new
    @opponent = Opponent.new
  end

  def create
    @opponent = Opponent.new(opponent_params(:name, :mascot))
    if @opponent.save
      redirect_to user_opponent_path(current_user, @opponent)
    else
      render 'new'
    end
  end

  def edit
    @opponent = Opponent.find_by(id: params[:id])
  end

  def update
    @opponent = Opponent.find_by(id: params[:id])
    @opponent.update(opponent_params(:name, :mascot))
    if @opponent.save
      redirect_to user_opponent_path(current_user, @opponent)
    else
      render 'edit'
    end
  end

  def index
    @opponents = Opponent.all
  end

  def show
    @opponent = Opponent.find_by(id: params[:id])
  end


  private

  def opponent_params(*args)
    params.require(:opponent).permit(*args)
  end

  def require_login
    return head(:forbidden) unless logged_in? && current_user.id == params[:user_id].to_i
  end




end
