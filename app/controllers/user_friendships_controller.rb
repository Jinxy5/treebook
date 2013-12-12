class UserFriendshipsController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :create, :index, :accept]

	def accept
		# why does this need to be scoped to the current user? This does the same thing:
		#	
		# @user_friendships = UserFriendship.find_by_id(params[:id])
		#
		# exactly the same result. Find out the benefit and the reasoning.
	
		@user_friendships = current_user.user_friendships.find_by_id(params[:id])
		
		# a shorthand for if @user_friendships.accept! == true . All methods evaluate to boolean true
		# 'true' if they are successful, and false if otherwise. This way, we can do a simple statement:
		if @user_friendships.accept!
			flash[:success] = "You are now friends with " + @user_friendships.friend.first_name + "!"
		else
			flash[:error] = "Friendship between you, " + current_user.profile_name + " and " + @user_friendships.friend.first_name + "could not be created"
		end

		redirect_to user_friendship_path
	end

	def edit
		@user_friendship = current_user.user_friendships.find_by_id(params[:id])	

	end

	def index
		@user_friendships = current_user.user_friendships.load 
	end
	
	def new 
		if params[:friend_id]

			@friend = User.find_by_profile_name(params[:friend_id])
			@user_friendship = current_user.user_friendships.new(friend: @friend)

		
		else
			flash[:error] = "Friend required"
		end
		
		if @friend

		else
			flash[:notice] = "That user could not be found"
			render file: 'public/404', status: 404
		end	
=begin
	This is Jason's way, that randomly has stopped working though. Isn't my way, above, a lot more robost though? If the error naming changes in a new rails version, whatver, my way will still work		 
		rescue ActiveRecord::RecordNotFound
			flash[:notice] = "That user could not be found"
			render file: 'public/404', status: 404
=end			
			

	end

	def create

		if params[:user_friendship][:friend_id]

			@friend = User.find_by_id(params[:user_friendship][:friend_id])
			logger.fatal @friend.inspect
		else

		end

		if @friend

			UserFriendship.request(current_user,@friend)

#			current_user.user_friendships.create(friend: @friend)
			
			flash[:success] = @friend.profile_name + " added as friend!"
			redirect_to profile_path(@friend.profile_name), status: 302

		else
			flash[:error] = "Friend required!"
			redirect_to root_path, status: 302
		end	
	end

end
