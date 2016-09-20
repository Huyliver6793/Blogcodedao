class UsersController < ApplicationController
 before_action :logged_in_user, only: [:edit, :update]
  def index
  end
  def new
  	@user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

   def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile đã được update"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def show
  	@user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page],per_page: 5)
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
  		flash[:success] = "Chào mừng bạn đến với Blog"
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation,:picture)
    end
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Hãy đăng nhập"
        redirect_to login_url
      end
    end
     def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
