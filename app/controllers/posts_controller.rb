class PostsController < ApplicationController
	
	before_action :find_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		
		respond_to do |format|
			if @post.save
				format.html { redirect_to @post, notice: 'Post was created'}
			else
				format.html { render :new}
			end
		end

	end

	def show
	end

	def edit
	end

	def update
		respond_to do |format|
			if @post.update(post_params)
				format.html { redirect_to @post, notice: 'Post has been updated'}
			else
				format.html { render :edit}
			end
		end
	end

	def destroy
		@post.destroy
		respond_to do |format|
			format.html { redirect_to posts_url, notice: 'Post has been deleted'}
		end
	end




	private

	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content)
	end

end
