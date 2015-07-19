class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.name}!"
      redirect_to (session[:intended_url] || user)
      session[:intended_url] = nil
    else
      flash[:alert] = 'Incorrect Password/Email'
      render :new
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'You have been signed out!'
  end

end
