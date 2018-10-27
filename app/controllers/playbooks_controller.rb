class PlaybooksController < ApplicationController

  def index
    @playbooks = current_user.playbooks.all
  end

  def show
    @playbook = Playbook.find_by(id: params[:id])
  end

  def new
    @playbook = Playbook.new
  end

  def create
    @playbook = current_user.playbooks.build(playbook_params(:name, :description, :situation))
    @playbook.save
    redirect_to user_playbook_path current_user, @playbook
  end

  def destroy
  end

  def update
  end

  private

  def playbook_params(*args)
    params.require(:playbook).permit(*args)
  end

end
