class UserFriendship < ActiveRecord::Base

=begin
	state_machine :alarm_state, :initial => :active, :namespace => 'alarm' do
	    event :enable do
	      transition all => :active
	    end

	    event :disable do
	      transition all => :off
	    end

	    state :active, :value => 1
	    state :off, :value => 0
  	end
=end
	# sets the 'state' column to pending whenever a new model (UserFriendship) is created

	state_machine :state, initial: :pending do

		after_transition on: :accept, do: [:send_accept_email, :accept_mutual_friendship!]
		after_transition on: :block, do: [:block_mutual_friendship!]
=begin 
	this creates an action called 'accepted!' and changes the 'state' column to 'accepted' when called
	it's basically a shorthand for this method (the exclamation mark, nothing more than a practise that doesn't
	change the code) is automatically added to the method name. This is because it's a potentially
	dangerous bang method that we've made:

	event :accept do
		transition any => :accepted
	end	

	is the same as writing:

	def accept!
		self.state == 'accepted'
	end
	
	automatically creates the accept! method, with an exclamation point

	the transition any => means set this state to accepted, and ignore what the previous state was. Transition to 'accepted' from any other state. (I think you can set rules here)

=end
		event :accept do
			transition any => :accepted
		end

		event :request do
			transition any => :requested
		end

		event :pend do
			transition any => :pending
		end

		event :deny do
			transition any => :denied
		end

		event :block do
			transition any => :blocked
		end


=begin
	not sure what this does but I think it's something to do with the 'requested?' method in the edit view

		This is how we add states:
			
			state :jimbob

		state_machine automatically creates validations for its column.

		so if we had this:
		
		state_machine :my_state do
			state :foo
			state :bar
			state :baz
			state :cax
		end

		the 'my_state' could only be changed to these strings:

		"foo"
		"bar"
		"baz"
		"cax"

		anything else would be an invalid state. 

		The 'state' method also automatically adds class methods to check on the state of an instance very easily (returns boolean true or false):
	
		@instance.foo? -> returns true if the state is foo, otherwise false
		@instance.bar? -> returns true if the state is bar, otherwise false
		@instance.baz? -> returns true if the state is baz, otherwise false
		@instance.cax? -> returns true if the state is cax, otherwise false

		The 'pending' state does exist, just like the others. But because it's the initial state, we can create it when we call state_machine:

		state_machine :state, initial: :pending do
		|-|
		state :pending

=end
		state :requested

		state :accepted

		state :denied

		state :blocked

		state :requestedpoopis


	end
	
	validate :not_blocked
	belongs_to :user

=begin this right here, is where the friend model comes into existance.
	
	belongs_to :friend, class_name: 'User'
	
	is basically a shorthand for creating a new model file, friend.rb and populating it with the same
	contents as user.rb (I think..maybe just the attributes and certain associations)
=end
	belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'
	
	after_destroy :delete_mutual_friendship!


####
## CLASS METHODS START
####
=begin
	Below are class methods, so they CANNOT be called like this:
	
	@friendship_1.send_request_email

	They can only be called by calling the actual model and passing in parameters:

	UserFriendship.request(@user_1, @user_2)

	They are available throughout the application, however they should only be concerned 
	with manipulating data related to the model, such as creating new database records of the model. 

	Example:

	def self.request(user1, user2)
		transaction do
			friendship1 = create!(user_id: user1.id, friend_id: user2.id, state: 'pending')
			friendship2 = create!(user_id: user2.id, friend_id: user1.id, state: 'requested') 
		end
	end

	So we can call it like this, anywhere in our application:

	UserFriendship.request(@user_1, @user_2)
=end
	

	def self.request(user1, user2)
		
=begin
	transaction block. This useful little guy means that either all of the code in its do block happens, or none of it happens.
	this is important, because code that doesn't work at all is much better than unpredicatable code that creates some weird residual 
	database records and then errors out.
=end  
		friendship1 = []

		transaction do
			friendship1 = create!(user_id: user1.id, friend_id: user2.id, state: 'pending')
			friendship2 = create!(user_id: user2.id, friend_id: user1.id, state: 'requested') 
		end

		# note we can call instance methods even inside the model we're in!
	
		###
		#
		# KL 
		# This behavior is not solid; if the email cannot send for any reason, the whole ajax request fails
		#
		###
		if !friendship1.new_record?
			#friendship1.send_request_email
		end

		logger.info "MODEL BEGIN"
		logger.info friendship1.inspect

		# lets return this friendship so we can run a .new_record? test on it in the action
		return friendship1
	end
	
	def not_blocked 
		if UserFriendship.exists?(user_id: user_id, friend_id: friend_id, state: 'blocked') ||  UserFriendship.exists?(user_id: friend_id, friend_id: user_id, state: 'blocked') 
			# the errors method automatically stops an instance from being saved and populates the ActionRecord::base hash
			errors.add(:base, "The friendship cannot be added.")
		end
	end

	def mutual_friendship
		self.class.where({user_id: friend_id,friend_id: user_id}).first
	end
=begin
Basically "delete" sends a query directly to the database to delete the record. In that case Rails doesn't know what attributes are in the record it is deleteing nor if there are any callbacks (such as before_destroy).
The "destroy" method takes the passed id, fetches the model from the database using the "find" method, then calls destroy on that. This means the callbacks are triggered.
You would want to use "delete" if you don't want the callbacks to be triggered or you want better performance. Otherwise (and most of the time) you will want to use "destroy".	

Sometimes you don't want a callback, inwhich case you use delete. This won't trigger the model's

	after_destroy hook

=end
	

	def delete_mutual_friendship!
		mutual_friendship.delete
	end

	def block_mutual_friendship!
# This may seem obious, but it results in an infinite loop. Think about it
#		mutual_friendship.block!
		if mutual_friendship
			mutual_friendship.update_attribute(:state, 'blocked')
		end
	end

	def accept_mutual_friendship!
		# Grab the mutual friendship and update the state without using the state machine as to not invoke callbacks
		logger.fatal "Here is self varaible:"
		logger.fatal self.inspect

		logger.fatal "Here is self.class variable:"
		logger.fatal self.class.inspect

		logger.fatal "Here is self.class.where variable:"
		logger.fatal self.class.where({user_id: friend_id,friend_id: user_id})
=begin
	.self = returns the object the instance method has been called on.
	instance methods can use .self in this context. Class methods can't, they have .self in their method name, as 
	their self returns the model.

	example: #<UserFriendship id: 1, friend_id: 2, user_id: 1, created_at: "2013-12-14 03:14:05", updated_at: "2013-12-14 03:14:05", state: "pending">

	.class = returns the class structure of an instance.

	example: UserFriendship(id: integer, friend_id: integer, user_id: integer, created_at: datetime, updated_at: datetime, state: string)

	so in this method, self.class.where is a way to query the user_friendship table. So my theory is that the class method
	is more than a simple way to return the hash structure. It opens up the whole table for querying as we can plainly see.

	Also, actually look at the statement regarding the relationship. It sort of flips the perspective around, so that when the method is
	called on the instance of a user, it finds that user's friend. The way it does this is by finding a user_friendship where the user_id is
	equal to the friend_id and the friend_id is equal to the user_id. It finds the user_friendship pertaining to the friend's point of view.
	It's a little bit tricky to understand, but it makes sense when you think
	about it. 
=end
		mutual_friendship.update_attribute(:state, 'accepted')
	end


####
## CLASS METHODS END
####


####
## INSTANCE METHODS:
####
=begin 
	Below are instance methods, not class methods, so they CANNOT be called like this:
		
		UserFriendship.send_requested_email

	They have to be called like this:

		@friendship_1.send_request_email
	
	when you call it like this, all of the attributes of the model are automatically populated, and are available to you.
	
	So if @friendship_1 looked like this:

	<#@UserFriendship id:101, friend_id:232, user_id:998, created_at:1, updated_at: 2, state:pending
	
	And had this instance method:

	def log_attributes
		logger.info id
		logger.info friend_id
		logger.info user_id
		logger.info created_at
		logger.info state
	end 
	Upon encountering this code 

	@friendship_1.log_attributes

	This data would be output to the console:

	101, 323, 998, 1, 2, "pending"

=end
	def send_request_email
#		UserNotifier.friend_requested(id).deliver
	end

	def send_accept_email
#		UserNotifier.friend_accepted(id).deliver	
	end

end
