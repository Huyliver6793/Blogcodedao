class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  		log_in user
  		redirect_back_or user
  	else
  		flash[:danger] = "Lỗi email hoặc mật khẩu không đúng"
  	render 'new'
  	end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
