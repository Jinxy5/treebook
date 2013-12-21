require 'spec_helper'
require 'ap'
describe UserFriendship do
	context "friendship exists" do
		before do
			@user_1 = FactoryGirl.create(:user_with_all_valid)
			@user_2 = FactoryGirl.create(:user_with_all_valid_two)
=begin
Consider this way instead of usering instance variables to equate to users

       		let(:admin) { FactoryGirl.create(:admin) }
        
       	    sign_in admin
=end
			@user_friendship = FactoryGirl.create(:user_friendship_1, user_id: @user_1.id, friend_id: @user_2.id )
		
			@user_friendship.reload
		end

		context "#mutual_friendship" do
			before do
				# We've set it up here

				# @user_1 is the instigator of the request, @user_2 the recipient
				UserFriendship.request(@user_1, @user_2)

				@friendship_1 = @user_1.user_friendships.where(friend_id: @user_2.id).first
				@friendship_2 = @user_2.user_friendships.where(friend_id: @user_1.id).first

			end

			it "should correctly find the mutual friend" do
				@friendship_1.mutual_friendship.should == @friendship_2
			end
#			mutual_friendship = self.class.where({user_id: friend_id,friend_id: user_id}).first
		end

		context "" do
			before do
				# We've set it up here

				# @user_1 is the instigator of the request, @user_2 the recipient
				UserFriendship.request(@user_1, @user_2)

				@friendship_1 = @user_1.user_friendships.where(friend_id: @user_2.id).first
				@friendship_2 = @user_2.user_friendships.where(friend_id: @user_1.id).first

				@friendship_1.reload
				@friendship_2.reload
			end

			context "#mutual_friendship" do
				it "should find the mutual friendship" do
					@friendship_1.mutual_friendship.should == @friendship_2
				end
			end

			context "#deny_mutual_friendship!" do
				before do
				end
			end

			context "#delete_mutual_friendship!" do
				before do
					@friendship_1.delete_mutual_friendship!
				end

				it "should destroy the mutual_friendship" do
					UserFriendship.count.should == 2
				end

			end

			context "#destroy" do
				before do
					@friendship_1.destroy
				end
				
				it "should destroy itself and the mutual_friendship" do
					UserFriendship.count.should == 1
				end
			end

			context "#accept_mutual_friendship!" do
				before do
					@friendship_1.accept_mutual_friendship!
					@friendship_1.reload
					@friendship_2.reload
				end
=begin
		@friendship_1.state == 'pending' at this point, because this is an isolated test that's only testing that the #accept_mutual_friendship
		method changes the mutual friend from requested to accepted. This method is called by the #accept! method (which updates the state of @friendship_1),
		so the #accept_mutual_friendship! method doesn't touch it 
=end
	
				it "should change the state of the mutual_friendship to accepted" do
					@friendship_2.state.should == 'accepted' 
				end
			end

			context "#accept!" do
				before do
					@friendship_1.accept!
					@friendship_1.reload
					@friendship_2.reload
				end

				it "should change the state of the friendship to accepted" do
					@friendship_1.state.should == 'accepted'
				end

				it "should change the state of the mutual_friendship to accepted" do
					@friendship_2.state.should == 'accepted' 
				end
			end

			context "#block!" do
				before do
					@friendship_1.block!
					@friendship_1.reload
					@friendship_2.reload
				end

				it "should set the state to blocked" do
					@friendship_1.state.should == 'blocked'
				end

				it "should set the friend to blocked" do
					@friendship_1.mutual_friendship.state.should == 'blocked'
					@friendship_2.state.should == 'blocked'
				end
	
				context "#blocked?" do
					before do
					end

					it "should be blocked" do
						@friendship_1.blocked?.should == true
					end

					it "should be blocked" do
						@friendship_1.mutual_friendship.blocked?.should == true
						@friendship_2.blocked?.should == true
					end
				end

				context "new requests cannot be made once blocked" do
					it "" do
						u = UserFriendship.new(user_id: @user_1.id, friend_id: @user_2.id, state: 'blocked')
						expect{u.save!}.to raise_exception("Validation failed: The friendship cannot be added.")
			#			UserFriendship.request(@user_1, @user_2)
			#			UserFriendship.count.should == 4
					end
				end
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
