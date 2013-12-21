class User < ActiveRecord::Base
  #attr_accessible :first_name, :last_name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :statuses
  
  has_many :user_friendships

  has_many :friends, through: :user_friendships,
                     conditions: { user_friendships: { state: 'accepted'} }

=begin
  right here is where we create a new model, 'pending_user_friendships', which is based on 'UserFriendship' model

  it's basically a shorthand for creating a new file, pending_user_friendships.rb and populating it with the contents of user_friendship.rb

  however, we do override the foreign_key and conditions. So 'pending_user_friendships' is exactly like 'user_friendships' apart from the foreign_key it uses
  in queries and the condition the 'state' column has to be in before it adds friends to a user's friends hash 

  conditions:

  pending_user_friendships is a relation that contains all friendships of the user with a state of 'pending'

  Looking at these relations, they are sort of like instance methods. I think it would be a good idea to think of them in this way. They are elabourate
  instance methods. So below, 'foreign_key: :user_id' is a bit like the auto-populated variable 'user_id' With this in mind, let's discuss the following:

  'pending_user_friendships' is a relation that loads all user_friendship records with a 'user_id' of the 'user' and with the 'state' of 'pending'
 
  this behavior is open to all new **things** that have a have_many reltionship through the 'pending_user_friendships' table
 
  'pending_friends' is acting as a handle, a new method (.pending_friends) for our User that contains the result of 'pending_user_friendships'
=end

  has_many :pending_user_friendships, class_name: 'UserFriendship',
                                      foreign_key: :user_id,
                                      conditions: { state: 'pending'}

  has_many :pending_friends, through: :pending_user_friendships, 
                             source: 'friend'

  has_many :requested_user_friendships, class_name: 'UserFriendship',
                                      foreign_key: :user_id,
                                      conditions: { state: 'requested'}

  has_many :requested_friends, through: :requested_user_friendships, 
                             source: 'friend'


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates_length_of :first_name, maximum: 15
  validates :first_name, presence: true, format: { with: /\A[a-zA-Z]*\z/}


  validates :last_name, presence: true
  validates :profile_name, presence: true

  def full_name
  	first_name.to_s + " " + last_name.to_s
  end

end
