class CommentsController < ApplicationController
	def create
		@micropost = Micropost.find(params[:micropost_id])
		@comment = @micropost.comments.new(comment_params)
		@comment.user_id = current_user.id 
		if @comment.save
		redirect_to micropost_path(@micropost)
		end
	end
	def show
		@comments = Comment.find(params[:user_id])
	end
	def new
  	  @micropost = Micropost.find(params[:micropost_id])
  	  @comment = @micropost.comments.new(:parent_id => params[:parent_id])
	end

	def index
		@micropost = Micropost.find(params[:micropost_id])
		@comments = @micropost.comments.arrange(:order => :created_at)
	end
	private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :user_id)
    end

    
end
