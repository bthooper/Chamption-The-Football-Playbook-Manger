class PlaysController < ApplicationController

  def index
    @plays = current_user.plays.all
  end

  def new
    @play = Play.new
    @playbooks = current_user.playbooks
  end

  def create
    @play = Play.new(play_params(:name, :description, :playbook_ids))

    if params[:play][:playbook_ids]
      params[:play][:playbook_ids].each do |playbook_id|
        @play.playbooks << Playbook.find_by(id: playbook_id)
      end
    else
      @play.errors.add(:playbooks, 'must belong to at least one playbook')
      render 'new'
      return
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


  private

  def play_params(*args)
    params.require(:play).permit(*args)
  end



end
