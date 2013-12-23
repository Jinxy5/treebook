class UserFriendshipsController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :create, :index, :accept]
	# display which markup languages the controller can render
	respond_to :html, :json

	def accept
		# why does this need to be scoped to the current user? This does the same thing:
		#	
		# @user_friendships = UserFriendship.find_by_id(params[:id])
		#
		# exactly the same result. Find out the benefit and the reasoning.
	
		@user_friendship = UserFriendship.find_by(id: params[:id])
		
		# a shorthand for if @user_friendships.accept! == true . All methods evaluate to boolean true
		# 'true' if they are successful, and false if otherwise. This way, we can do a simple statement which calles the .accept! method and sets it
		if @user_friendship.accept!
			flash[:success] = "You are now friends with " + @user_friendship.friend.first_name + "!"
		else
			flash[:error] = "Friendship between you, " + current_user.profile_name + " and " + @user_friendship.friend.first_name + "could not be created"
		end

		redirect_to root_path
	end

	def destroy
	# Proper way to scope:
	#    @user_friendship = current_user.user_friendships.find_by_id(params[:id])

		@user_friendship = UserFriendship.find_by(id: params[:friend_id])
		
		logger.fatal "@user_friendship"
		logger.fatal @user_friendship.inspect

		logger.fatal "params"
		logger.fatal params.inspect
		logger.fatal params[:friend_id]

		if @user_friendship.destroy
			flash[:success] = "User friendship deleted!"
		end
		redirect_to root_path 
	end

	def block
=begin
	And what we're going to do is scope this to the current user,
04:35
making sure that nobody can just find any other user friendships.
=end
#		@user_friendship = current_user.user_friendships.find_by(id: params[:id])

# Proper way to scope:
#    @user_friendship = current_user.user_friendships.find_by_id(params[:id])
		@user_friendship = UserFriendship.find_by(id: params[:id])

		if @user_friendship.block!
			flash[:success] = "You have successfully blocked " + @user_friendship.friend.first_name + " !"
		else
			flash[:error] = "You could not block " + @user_friendship.friend.first_name  
		end
		redirect_to root_path
	end
	
	def edit
		@friend = User.find_by(profile_name: params[:id])

		logger.info "------"
		logger.info params.inspect

		@user_friendship = UserFriendship.find_by(friend_id: @friend.id)	

		logger.info "_*&&"
		logger.info @user_friendship.inspect
	end

	def index
		@user_friendships = current_user.user_friendships.load
		# instead of rendering a view, we can popul
		respond_with @user_friendships
	end
	
	def new 
		if params[:friend_id]

			@friend = User.find_by_profile_name(params[:friend_id])
			@user_friendship = current_user.user_friendships.new(friend: @friend)

			logger.fatal "@friend:"
			logger.fatal @friend.inspect

			logger.fatal "@user_friendship:"
			logger.fatal @user_friendship			
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

		# 
			logger.fatal "Here is the params hash"
			logger.fatal params.inspect
			logger.fatal params[:friend_id].inspect

#		if params[:friend_id]

			logger.fatal "Here is the id:" 
			logger.fatal params[:friend_id].inspect

# where this model is being called I have a slightly weird error...the params hash is populated with the friend_id inside a user_friendship named hash. No idea why, and it doesn't happen with ajax so lookinto that.
# here's the hacky work around!
#			@friend = User.find_by_id(params[:user_friendship][:friend_id])

			@friend = User.find_by_id(params[:friend_id])

			logger.fatal "Here is the friend:"
			logger.fatal @friend.inspect

#		else

#		end

		if @friend



			@user_friendship = UserFriendship.request(current_user,@friend)

			logger.fatal @user_friendship.inspect

=begin
	respond_to block allows different formats to be rendered. Remember, it's at the top
=end
		respond_to do |format|
=begin
new_record?() public

Returns true if this object hasn’t been saved yet – that is, a record for the object doesn’t exist in the data store yet; otherwise, returns false.

I think that means it returns true if it doesn't exist in the database

=end


			if @user_friendship.state.blocked?

			logger.info "IooI Blocked"
			logger.info @user_friendship.inspect
			
				logger.info "YES YES THE STATE IS BLOCKED"

				format.html do
					flash[:error] = @friend.first_name + " has blocked you. Your friend requests will be ignored."
					redirect_to root_path
				end			


			elsif @user_friendship.new_record?

			logger.info "IooI New Record"
			logger.info @user_friendship.inspect

				format.html do
					flash[:error] = "There was a problem creating that friend request"
					redirect_to profile_path(@friend.profile_name), status: 302		
				end

				format.json do
					render json: @user_friendship.to_json, status: :precondition_failed
				end
			else

			logger.info "IooI Else"
			logger.info @user_friendship.inspect

				format.html do
					flash[:success] = "Friend request sent to " + @friend.first_name + "!"
					redirect_to profile_path(@friend.profile_name), status: 302
				end
		
				format.json do
					# This behavior is not solid; if the email cannot send for any reason, the whole ajax request fails
					render json: @user_friendship.to_json, status: :precondition_failed
				end	
			
			end


		end

		else
			flash[:error] = "Friend required! Param:" + params[:user_friendship][:friend_id].inspect
			redirect_to root_path, status: 302
		end	
	end

end
