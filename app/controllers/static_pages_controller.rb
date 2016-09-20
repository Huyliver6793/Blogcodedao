class StaticPagesController < ApplicationController
 
  def home
  	@microposts = Micropost.paginate(page: params[:page],per_page: 5)
  end

  def about
  end

  def post
  	@micropost = current_user.microposts.build
  end 
 
end
