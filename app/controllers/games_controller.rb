class GamesController < ApplicationController

  before_action :require_login

  def index
    @games = current_user.games
  end

  def show 
    @game = Game.find_by(id: params[:id])
    
  end

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.new(game_params(:date, :location, :opponent_id))
    if @game.save
      redirect_to user_game_path(current_user, @game)
    else
      render 'new'
    end
  end

  def edit
    @game = Game.find_by(id: params[:id])
  end

  def update
    @game = Game.find_by(id: params[:id])
    @game.update(game_params(:date, :location, :opponent_id))
    if @game.save
      redirect_to user_game_path(current_user, @game)
    else
      render 'edit'
    end
  end

  def destroy
    @game = Game.find_by(id: params[:id])
    @game.destroy
    redirect_to user_games_path(current_user)

  end

  private

  def game_params(*args)
    params.require(:game).permit(*args)
  end

  def require_login
    return head(:forbidden) unless logged_in? && current_user.id == params[:user_id].to_i
  end
    
end
