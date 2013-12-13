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

		after_transition on: :accept, do: :send_accept_email
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
	

	belongs_to :user

=begin this right here, is where the friend model comes into existance.
	
	belongs_to :friend, class_name: 'User'
	
	is basically a shorthand for creating a new model file, friend.rb and populating it with the same
	contents as user.rb (I think..maybe just the attributes and certain associations)
=end
	belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'




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
		friendship1.send_request_email
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
		UserNotifier.friend_requested(id).deliver
	end

	def send_accept_email
		UserNotifier.friend_accepted(id).deliver	
	end

end
