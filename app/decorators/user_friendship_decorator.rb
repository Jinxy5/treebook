class UserFriendshipDecorator < Draper::Decorator
# imporant line theree
  decorates :user_friendship

  def friendship_state
=begin we can call the decorator's model (in this case  the UserFriendship model using the keyword 'model';

  	model.state == UserFriendship.state

  	The model keyword is evalutated as the model of the object that has had the 'decorate' method called on it
  	else where in the application (be it in a model, another decorator, a view or a controller. They should be
  	called from a controller mostly)
  	
  	#elsewhere
  	UserFriendshipDecorator.decorate(@user_friendship_1) (where @user_friendship_1 is: <#UserFriendship 0x#>)
  	#here
  	model.state
  	||
  	UserFriendship.state

	#elsewhere
  	UserFriendshipDecorator.decorate(@user_friendship_1) (where @user_friendship_1 is: <#User 0x#>)
  	#here
  	model.first_name
  	||
  	User.first_name
	#elsewhere
  	UserFriendshipDecorator.decorate(@user_friendship_1) (where @user_friendship_1 is: <#Foobaryfoobars 0x#>)
  	#here
  	model.bazcax?
  	||
  	Foobaryfoobars.bazcax?
=end
  	case model.state
  	when "pending"
	  	"Pending"
	when "accepted"
		"Accepted"
	when "requested"
		"Requested"
	else
		"None"
	end
  end

  def sub_message	
    case model.state
  	when "pending"
	  	"<h3> Do you really want to be friends with Jim?</h3>"
	when "accepted"
		"<h3> You are friends with Jim. </h3>"
	when "requested"
=begin
	It appears to be that the model keyword is also the instance, somehow. How else could we do
	model.friend.first_name ?
=end
		"<h3> Do you really want to be friends with " + model.friend.first_name + "?</h3>"
	else
		"None"
	end
end
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
