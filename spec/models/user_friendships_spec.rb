require 'spec_helper'

describe UserFriendship do
	
	it "should belong_to a user" do
		should belong_to(:user)
	end

	it "should belong_to a freind" do
		should belong_to(:friend)
	end

	context "can create a freidnships" do
		before do
			@user_1 = FactoryGirl.create(:user_with_all_valid)
			@user_2 = FactoryGirl.create(:user_with_all_valid_two)
		end

		it "should have friends" do
			expect{ UserFriendship.create(user: @user_2, friend: @user_1)}.to_not raise_error
		end
	end


	context "can create a freidnships" do
		before do
			@user_1 = FactoryGirl.create(:user_with_all_valid)
			@user_2 = FactoryGirl.create(:user_with_all_valid_two)
		end

		it "should have friends" do
			expect{ UserFriendship.create(user: @user_2, friend: @user_1)}.to_not raise_error
		end
	end
end
