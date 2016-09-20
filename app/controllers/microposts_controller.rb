class MicropostsController < ApplicationController


	def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id])
     if @micropost.present?
      @micropost.destroy
    end
    redirect_to root_url
  end

  def show
    @micropost = Micropost.find(params[:id])
    @microposts = Micropost.paginate(page: params[:page],per_page: 5)
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end
  def index
  end

  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update_attributes(micropost_params)
      flash[:success] = "Cập nhật bài viết thành công"
      redirect_to root_url
    else
      flash[:danger] = "Cập nhật thất bại"
      render 'edit'
    end
  end

  private

    def micropost_params
      params.require(:micropost).permit(:title, :content)
    end
end
