class PlaysController < ApplicationController

  def index
  end

  def new
    @play = Play.new
    @playbooks = current_user.playbooks
  end

  def create
    @play = Play.new(play_params(:name, :description, playbook_attributes: [:playbook_ids]))
    @play.playbooks << params[:play][:playbook_ids]
    binding.pry
    if @play.save
      redirect_to user_play_path current_user, @play
    else
      render 'new'
    end
  end

  def show
    @play = Play.find_by(params[:id])
  end


  private

  def play_params(*args)
    params.require(:play).permit(*args)
  end



end
