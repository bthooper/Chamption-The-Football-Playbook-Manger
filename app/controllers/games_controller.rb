class GamesController < ApplicationController

  def index
    @games = current_user.games
  end

  def show 
    
  end

  def new
    @game = Game.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delte
  end
    
end
