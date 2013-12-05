require 'spec_helper'
describe UserFriendshipsController do
	user_1 = {}
	user_2 = {}

	context "when not logged in" do
	 	it "should redirect to the login path when creating a new friendship" do
			get :new
			response.response_code.should == 302
			response.should redirect_to new_user_session_path
		end
	end
	
	context "\b: When a user is logged in" do
		before do
			# devise helper method
			user_1 = FactoryGirl.create(:user_with_all_valid)
			user_2 = FactoryGirl.create(:user_with_all_valid_two)
			sign_in user_1
		end

		it "should get to a new page when created a new friendships" do
			get :new
			response.response_code.should == 200
			response.should render_template(:new)
		end

		it "should set a flash error message"  do
			get :new, {}
			flash[:error].should == "Friend required"
		end

		it "should display the friend's name" do
			pending "Can't install headless server on mac"
			get :new, friend_id: user_2.id
			page.should have_content("Chipboy76")
		end

		it "assigns @teams" do
			get :new, friend_id: user_2.id
			assigns[:friend].profile_name.should == "Chipboy76"

			# :friend is refering to a @friend in the view
		end

		it "assings @user_friendship between user_1 and user_2" do
			get :new, friend_id: user_2.id
			assigns[:user_friendship].user_id.should == user_1.id
			assigns[:user_friendship].friend_id.should == user_2.id
		end

		context "\b, an invalid GET request for a user that doesn't exist" do
			# is this a shorthand for before(:each)?
			before(:each) do 
				get :new, friend_id: 3142769
			end

			it "populates the flash" do
				pending "Can't install headless server on mac"
				page.should have_content("That user could not be found")
			end

			it "should return a 404 status" do
				response.response_code.should == 404
			end
		end		
	end
end