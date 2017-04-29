class Admin::StoriesController < ApplicationController
	layout "admin"
	before_action :find_story, only:[:show,:edit, :update, :destroy]
	def home
		@page_title = "後台首頁"
		@stories_count = Story.all.count
		@projecs_count = Project.all.count
		@users_count = User.all.count
		#@reports_count = Report.all.count
	end

	def index 
		@stories = Story.all

	end

	def show 

	end

	def new
		@story = Story.new
		#5.times {@photos = @project.photos.build}

	end

	def create
		@story = Story.new(story_params)	
		
		if @story.save
			respond_to do |format|
				  format.html { redirect_to admin_story_path(@story)}
				  format.js	
				  
			end		
		else 
			render :new
		end
	end

	def edit 
		#a = @story.photos.count
		#b = 5-a
		#b.times {@photos = @story.photos.build}
	end

	def update
		if @story.update(story_params)		
			
			respond_to do |format|
				  format.html { redirect_to admin_story_path(@story)}
				  format.js
			end		
		else 
			render :edit
		end
	end


	def destroy 
		@story.destroy
		redirect_to admin_stories_path
	end





	protected

	def find_story
		@story = Story.find(params[:id])
	end

	def story_params
		params.require(:story).permit(:story_time,:title,:content,:reflection,:youtube_link,:is_public,:location,:image)
	end



end