class PlaysController < ApplicationController

  def index
  end

  def new
    @play = Play.new
    @playbooks = current_user.playbooks
  end

  def create
    @play = current_user.plays.build(play_params(:name, :description))
    if @play.save
      redirect_to user_play_path current_user, @play
    else
      render 'new'
    end
  end

  private

  def play_params(*args)
    params.require(:play).permit(*args)
  end



end
