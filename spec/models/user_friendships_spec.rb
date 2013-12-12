require 'spec_helper'
require 'ap'
describe UserFriendship do
	context "friendship exists" do
		before do
			@user_1 = FactoryGirl.create(:user_with_all_valid)
			@user_2 = FactoryGirl.create(:user_with_all_valid_two)


			@user_friendship = FactoryGirl.create(:user_friendship_1, user_id: @user_1.id, friend_id: @user_2.id )
		
			@user_friendship.reload
		end

		context "\b, and the accept method has been called" do
			before do
				@user_friendship.accept!
			end
			
			it "should have an accepted state" do
				@user_friendship.state.should == "accepted"
			end
		end
	end

=begin	
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

	context "two valid users exist with a friendship between them" do
		before do
			@user_1 = FactoryGirl.create(:user_with_all_valid)
			@user_2 = FactoryGirl.create(:user_with_all_valid_two)

			# much prefer " user_id: @user_1.id " to 'magic' "user: @user_1"

			@user_friendship = UserFriendship.create user_id: @user_1.id, friend_id: @user_2.id
		end

		it "have a pending state" do
			@user_friendship.state.should == "pending"
		end

		it "should send en email" do
		#	ActionMailer::Base.deliveries.size.should == 1
		end

		it "should have a send_request_email method that sends an email no problem" do
				pending('find better way to test emails')

			expect{@user_friendship.send_request_email}.to change{ActionMailer::Base.deliveries.size}.from(0).to(1)
		end

		it "should have a send_request_email method that sends an email no problem" do
					pending('find better way to test emails')
	
			expect{@user_friendship.send_request_email}.to change{ActionMailer::Base.deliveries.size}.from(0).to(1)
		end

		context ".request" do
			it "should create two user_friendships when the request method " do
				pending('find better way to test emails')
				expect{UserFriendship.request(@user_1, @user_2)}.to change{UserFriendship.count}.from(1).to(3)

			#	ap UserFriendship.all

			end	

			it "should send email" do
				pending("Find better way to test email")
			end
		end
=end
=begin		context "\b, and the .request method has been called" do
			before do
				UserFriendship.request(@user_1, @user_2)
			end
		end
=end

=begin
		context "\b, and the accept method has been called" do
			before do
				@user_friendship.accept!
			end

			it "should have an accepted state" do
				@user_friendship.state.should == "accepted"
			end

			it "should send a friend_accepted email" do
				pending('find better way to test emails')
				expect{@user_friendship.send_accept_email}.to change{ActionMailer::Base.deliveries.size}.from(3).to(4)
			end

			it "should add the friend to the users friends list" do
				@user_1.friends.reload
				@user_1.friends[0].should == @user_2
			end

		end




	end
=end





end
