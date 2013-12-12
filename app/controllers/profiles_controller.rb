require 'ap'
class ProfilesController < ApplicationController
  def show
  	
  	@profile = User.find_by_profile_name (params[:friend_id])

  	if @profile == nil
	  	raise ActiveRecord::RecordNotFound 
	end
	

  	# find finds one user, where finds all users where.
	@statuses = Status.where user_id: @profile.id
	

	@friends = []

	friends = @profile.user_friendships.load

	friends.each do |f|
		@friends << User.where(id: f.friend_id)
	end

	# should this be neccessary?
	flash[:error] = nil

	rescue ActiveRecord::RecordNotFound
		
		flash[:error] = "User could not be found"
		render file: 'public/404.html', status: 404

	end


end
