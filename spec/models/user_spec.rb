require 'spec_helper'
require 'ap'
describe User do
=begin
	it "has manu user_friendships" do
		should have_many(:user_friendships)
	end

	it "has manu friends" do
		should have_many(:friends)
	end

	context "" do
		before do
			@user_1 = FactoryGirl.create(:user_with_all_valid)
			@user_2 = FactoryGirl.create(:user_with_all_valid_two)
			
			UserFriendship.create(user_id: @user_1.id, friend_id: @user_2.id)
		end
		it "can't add itself as a friend"
			pending("Mesa pending!")
			expect{UserFriendship.create(user_id: @user_1.id, friend_id: @user_1.id)}.to raise_error		
		end

		it "can't add the same friend twice"
			# note the context' before block. @user_2 is alreay a freidn of @user_1. That's why this shouls raise an error
			expect{UserFriendship.create(user_id: @user_1.id, friend_id: @user_2.id)}.to raise_error
		end
	end


	context "with this and that" do
		before do
			@user_1 = FactoryGirl.create(:user_with_all_valid)
			@user_2 = FactoryGirl.create(:user_with_all_valid_two)

			UserFriendship.create(user_id: @user_1.id, friend_id: @user_2.id)
			UserFriendship.create(user: @user_1, friend: @user_2)
				
		end

		it "should not raise errors" do	
			expect{UserFriendship.create(user_id: @user_1.id, friend_id: @user_2.id)}.to_not raise_error
			expect{UserFriendship.create(user: @user_1, friend: @user_2)}.to_not raise_error		
		end
	
		it "should not raise errors" do
			expect{@user_1.friends}.to_not raise_error
		end

		it "should contain user hash" do
			@user_1.friends[0].first_name.should == "Mattychips"
			@user_1.friends[0].last_name.should == "Matthews"
			@user_1.friends[0].profile_name.should == "Chipboy76"
			@user_1.friends[0].email.should == "chips@hotmail.co.uk"
		end

	end
=end
end
