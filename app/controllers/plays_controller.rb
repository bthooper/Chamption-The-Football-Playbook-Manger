class PlaysController < ApplicationController

  def index
    @plays = current_user.plays.all
  end

  def new
    @play = Play.new
    @playbooks = current_user.playbooks
  end

  def create
    @play = Play.new(play_params(:name, :description))
    if params[:play][:playbook_ids]
      params[:play][:playbook_ids].each do |playbook_id|
        @play.playbooks << Playbook.find_by(id: playbook_id)
      end
    end
    if @play.save
      redirect_to user_play_path current_user, @play
    else
      render 'new'
    end
  end

  def show
    @play = Play.find_by(id: params[:id])
  end

  def edit
    @play = Play.find_by(id: params[:id])
  end
  
  def update
    @play = Play.find_by(id: params[:id])
    @play.update(play_params(:name, :description))
    @play.playbooks = []
    if params[:play][:playbook_ids]
      params[:play][:playbook_ids].each do |playbook_id|
        @play.playbooks << Playbook.find_by(id: playbook_id)
      end
    end
    if @play.save
      redirect_to user_play_path current_user, @play
    else
      render 'edit'
    end
  end
  
  def destroy

  end
  



  private

  def play_params(*args)
    params.require(:play).permit(*args)
  end



end
