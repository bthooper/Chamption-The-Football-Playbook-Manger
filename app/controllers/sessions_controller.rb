class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:danger] = 'Invalid credentials.'
      render 'new'
    end
  end
  
  def destroy
    session.destroy
    redirect_to root_path
  end
end
