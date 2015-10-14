class SessionsController < ApplicationController
  before_action :user_params, only: [:create]

  def new
    
  end

  def create
    user = User.where(email: user_params[:email]).first
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to users_path, notice: "Welcome to home index"
    else
      flash[:error] = "Email or Password is invalid"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: "Dang xuat thanh cong"
  end

  private

    def user_params
      params.require(:session).permit(:email, :password)
    end
end
