class UserFriendshipsController < ApplicationController
	before_filter :authenticate_user!, only: [:new]
	def new 
		if params[:friend_id]
			@friend = User.find(params[:friend_id])
			# I think this does the same thing:
			# UserFriendship.new(user_id: current_user.id, friend: @friend)
			@user_friendship = current_user.user_friendships.new(friend: @friend)
		else
			flash[:error] = "Friend required"
		end

	rescue ActiveRecord::RecordNotFound
		flash[:notice] = "That user could not be found"
		render file: 'public/404', status: 404
	end
end
