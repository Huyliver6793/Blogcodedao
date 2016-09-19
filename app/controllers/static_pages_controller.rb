class StaticPagesController < ApplicationController
 
  def home
  	@microposts = Micropost.all
  end

  def about
  end

  def post
  	@micropost = current_user.microposts.build
  end 
 
end
