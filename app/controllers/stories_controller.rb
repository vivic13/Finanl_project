class StoriesController < ApplicationController
	before_action :authenticate_user!, except:[:index,:show]
	before_action :find_story, except:[:index]
	
	def index 
		@stories = Story.where(:is_public => true) 
	end


	def show 
		
	end

	def like 	
		unless @story.already_liked(current_user)
			@like = Like.create(:user => current_user, :story => @story)
			redirect_to stories_url
		end
	
	end

	def unlike
		if @story.already_liked(current_user)
			@like = @story.find_like(current_user)
			@like.destroy
			redirect_to stories_url
		end
	end

	private

	def find_story
		@story = Story.find(params[:id])
	end

end
