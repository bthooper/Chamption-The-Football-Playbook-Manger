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

  def create_fb
    @user = User.find_or_create_by(email: auth['info']['email']) do |u|
       u.name = auth['info']['name']
       u.password = "jdkdiejfkeidk"
    end

    @user.create_profile(nickname: "", role: "")
     
    session[:user_id] = @user.id

    redirect_to user_path(@user)
     
  end
     
  
  def destroy
    session.destroy
    redirect_to root_path
  end

  private
     
  def auth
    request.env['omniauth.auth']
  end

end
