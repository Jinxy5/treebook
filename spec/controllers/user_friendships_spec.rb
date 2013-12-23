require 'spec_helper'
require 'ap'
describe UserFriendshipsController, type: :controller do
	
	context "" do
		before do
		end
		after do
			ActionMailer::Base.deliveries.clear
		end

		context "\b: When four valid User instances exist, @user_1, @user_2, @user_3, @user_4" do
			before do
				@user_0 = FactoryGirl.build(:user_0)
				@user_1 = FactoryGirl.build(:user_1)
				@user_2 = FactoryGirl.build(:user_2)
				@user_3 = FactoryGirl.build(:user_3)
			end

			context "\b, and when not logged in" do
				before do
				end
			end

			context "\b, and when logged in as @user_1" do
				before do
					sign_in @user_0
				end
				context "\b, and when a UserFriendship, @user_friendship_1, is joining @user_1 with @user_2," do
					before do
					#	@user_friendship_0 = UserFriendship.create(user_id: @user_1.id, friend_id: @user_2.id)
					#	@user_friendship_1 = UserFriendship.create(user_id: @user_2.id, friend_id: @user_1.id)
					#	@user_friendship_2 = UserFriendship.create(user_id: @user_3.id, friend_id: @user_4.id, state: 'pending')
					#	@user_friendship_3 = UserFriendship.create(user_id: @user_4.id, friend_id: @user_3.id, state: 'requested')
						
						@user_friendship_0 = FactoryGirl.build(:pending_user_0_user_1)
						@user_friendship_1 = FactoryGirl.build(:requested_user_1_user_0)
						@user_friendship_2 = FactoryGirl.build(:pending_user_0_user_2)
						@user_friendship_3 = FactoryGirl.build(:requested_user_2_user_0)


					#	ap FactoryGirl.build(:pending_user_0_user_1)
					end

					context ".requestedpoopis?" do
						it "should not raise error" do
							expect{ @user_friendship_0.requestedpoopis? }.to_not raise_error
						end

						it "should return false" do
							@user_friendship_0.requestedpoopis?.should == false
						end
					end

					context ".requested?" do
						it "should not raise error" do
							expect{ @user_friendship_0.requested? }.to_not raise_error
						end

						it "should return false" do
							@user_friendship_0.requested?.should == false
						end
					end


					context ".pending?" do
						it "should not raise error" do
							expect{ @user_friendship_0.pending? }.to_not raise_error
						end

						it "should return false" do
							@user_friendship_0.pending?.should == true
						end
					end

					context ".accepted?" do
						it "should not raise error" do
							expect{ @user_friendship_0.accepted? }.to_not raise_error
						end

						it "should return false" do
							@user_friendship_0.accepted?.should == false
						end
					end
					
					context ".denied?" do
						it "should not raise error" do
							expect{ @user_friendship_1.denied? }.to_not raise_error
						end
		
						it "should return false" do
							expect @user_friendship_1.denied?.should == false
						end
					end

					context "#blocked_friends" do
						before do
							get :index, list: 'blocked'
							render
						end

						it "should get the index" do
							response.response_code.should == 200
						end

						it "should not show pending friends" do
						    render

						    rendered.should contain('Shirt')
						    rendered.should contain('50.0')
						end
					end

					context ".blocked?" do
						it "should not raise error" do
							expect{ @user_friendship_1.blocked? }.to_not raise_error
						end

						it "should return false" do
							expect @user_friendship_1.blocked?.should == false
						end
					end

					context ".accept!" do
						it "should not raise error" do
							expect{ @user_friendship_1.accept! }.to_not raise_error
						end

						it "should return true" do
							@user_friendship_1.accept!.should == true
						end

						it "should set the state to accepted" do
							@user_friendship_1.accept!
							@user_friendship_1.state.should == 'accepted'
						end
					end


					context ".request!" do
						it "should not raise error" do
							expect{ @user_friendship_1.request! }.to_not raise_error
						end

						it "should return true" do
							@user_friendship_1.accept!.should == true
						end

						it "should set the state to accepted" do
							@user_friendship_1.accept!
							@user_friendship_1.state.should == 'accepted'
						end
					end

					context ".requested?" do
						it "should not raise error" do
							expect{ @user_friendship_1.requested? }.to_not raise_error
						end

						it "should return false" do
							@user_friendship_1.requested?.should == false
						end
					end


					context ".pending?" do
						it "should not raise error" do
							expect{ @user_friendship_1.pending? }.to_not raise_error
						end

						it "should return false" do
							@user_friendship_1.pending?.should == true
						end
					end

					context ".accepted?" do
						it "should not raise error" do
							expect{ @user_friendship_1.accepted? }.to_not raise_error
						end

						it "should return false" do
							@user_friendship_1.accepted?.should == false
						end
					end
					
					context ".denied?" do
						it "should not raise error" do
							expect{ @user_friendship_1.denied? }.to_not raise_error
						end
		
						it "should return false" do
							expect @user_friendship_1.denied?.should == false
						end
					end

					context ".block!" do
						it "should not raise error" do
							expect{ @user_friendship_1.block! }.to_not raise_error
						end

						it "should return true" do
							@user_friendship_1.block!.should == true
						end

						it "should change the state to blocked" do
							@user_friendship_1.block!
							@user_friendship_1.reload		
							@user_friendship_1.state.should == 'blocked'
						end
					end

					context ".index" do
						before do
							get :index
						end

						it "should assign" do
							assigns(:user_friendships).should == [@user_friendship_1]
						end

						it "\b's view should show @user_1's name" do
							pending('Need to install headless server')
							visit '/index_friend'
							fill_in 'Email', with: @user_1.email
							fill_in 'Password', with: @user_1.password
							
							click_button 'Sign in'

							page.should have_content 'Welcome to the index of friends!'
							page.should have_content 'Treebook'
	#						page.should have_content 'Pending'
	#						page.should have_content 'Active'
						end
					end

					context ".accept" do
						before do
							put :accept, id: @user_friendship_1.id
							@user_friendship_1.reload
						end

						it "should assign a user_friendship" do
							assigns(:user_friendship).should == @user_friendship_1
						end

						it "should update the state to accepted" do
							@user_friendship_1.state.should == 'accepted'
						end

						it "should populate the flash with a success message" do
							flash[:success].should == "You are now friends with " + @user_friendship_1.friend.first_name + "!"
							flash[:success].should == "You are now friends with " + @user_2.first_name + "!"
						end
					end

					context ".edit" do
						before do
							get :edit, id: @user_friendship_1.friend.profile_name
						end

						it "should respond with a redirect" do
							response.response_code.should == 200
						end

						it "should assign a friend" do
							assigns(:friend).should == @user_2
						end
						
						it "should assign a user_friendship" do
							assigns(:user_friendship).should == @user_friendship_1
						end




					end

					it "should not send an email" do
						ActionMailer::Base.deliveries.size.should == 0
					end

					it "should not have @user_2 in its friends array" do
						@user_1.friends.should_not include(@user_2)
					end

					it "should have @user_2 in its pending_friends array" do
						@user_1.pending_friends.should include(@user_2)
					end

					it "should have an empty friends array" do
						@user_1.friends.should == []
					end

					context ".destroy" do
						before do
							delete :destroy, friend_id: @user_friendship_1.id
						end

						it "should assign @user_friendship" do
							assigns(:user_friendship).should == @user_friendship_1
						end

						it "should delete a user and its mutual friend" do
							UserFriendship.count.should == 0
						end

						it "should populate the flash" do
							flash[:success].should == "User friendship deleted!"
						end
					end

					context ".request" do
						before do
							UserFriendship.request(@user_1, @user_2)
						end

						it "should create two user friendships" do
							# the first two UserFriendships are @user_friendship_1 and @user_friendship_2, and the next 2 are the ones we're concerned with
							UserFriendship.count.should == 4
						end
					end

					context "#block" do
						before do
							put :block, id: @user_friendship_1.id
							# every single time a database entry changes, we need to reload it. We've just called the block method, that changes the #state.
							@user_friendship_1.reload
						end

						it "should assign a user_friendship" do
							assigns(:user_friendship).should == @user_friendship_1
						end

						it "should set the state to blocked" do
							@user_friendship_1.state.should == 'blocked'
						end

						it "should be redirect" do
							response.response_code.should == 302
						end

					end



					context ".accept!" do
						before do
							@user_friendship_1.accept!
						end
					
						it "should change the state from 'pending' to 'accepted' " do
							@user_friendship_1.state.should == 'accepted'
						end

						it ".accepted? should return true" do
							@user_friendship_1.accepted?.should == true
						end

						it ".pending? should return false" do
							@user_friendship_1.pending?.should == false
						end

						it "should send an email" do
							pending('Still need to get a good mailer going')
							ActionMailer::Base.deliveries.size.should == 1
						end

						it "should include friend" do
							@user_1.friends.should include(@user_2)
						end
				
						it "should have an empty pending_friends array" do
							@user_1.pending_friends.should == []
						end
					end

					context "#create" do
						# create uses the friend's id. 
						before do
							get :create, friend_id: @user_2.id
						end

						it "should create two user friendships" do
							# the first two UserFriendships are @user_friendship_1 and @user_friendship_2, and the next 2 are the ones we're concerned with
							UserFriendship.count.should == 4
						end

						it "" do
							response.response_code.should == 302
						end

						it "" do
							response.should redirect_to profile_path(@user_2.profile_name)
						end



						it "should populate the flash with a success message" do
							flash[:success].should == "Friend request sent to " + @user_friendship_1.friend.first_name + "!"
							flash[:success].should == "Friend request sent to " + @user_2.first_name + "!"
						end
					end




=begin
					context "\b, a PUT request to the #accept action with the :id of @user_friendship_1" do
						before do
							put :accept, id: @user_friendship_1.id
							@user_friendship_1.reload
						end

						it "should assign @user_friendship_1 to the instance variable #|@user_friendships|" do
							assigns(:user_friendships).should == @user_friendship_1
						end


						it "should change @user_friendship_1.state from 'pending' to 'accepted' " do
							@user_friendship_1.state.should == 'accepted'	
						end

						it "should populate the flash[:success] with the success message '' " do
							flash[:success].should == "You are now friends with " + @user_2.first_name + "!"
						end

						it "should redirect to the show route of that friendship" do
							response.should redirect_to user_friendship_path 
						end
					end 
=end
				end
			end
		end
	end
end
=begin
		context "\b, and when a UserFriendship, @user_friendship_2, is joining @user_1 with a non-existant user" do
			before do
				@user_friendship_2 = FactoryGirl.create(:pending_user_friendship, user_id: @user_1.id, friend_id: 76987987987987)
				@user_friendship_2.reload
			end

			it "@user_friendship_2.state should equal 'pending' by default, when it is created" do
				@user_friendship_2.state.should == 'pending'
			end

			context "\b, a PUT request to the #accept action with the :id of @user_friendship_2" do
				before do
					put :accept, id: @user_friendship_2.id
					@user_friendship_2.reload
				end

				it "should not change @user_friendship_2.state from 'pending' to 'accepted'; it should leave it as 'pending'" do
					@user_friendship_2.state.should == 'pending'
				end

				it "should populate the flash[:error] with the error message '' " do
					flash[:error].should == "Friendship could not be created"
				end

				it "should redirect to the" do
					pending('Boop');
					redirect_to user_friendships_path 
				end
			end

		end		

	end
end
=end

=begin
	user_1 = {}
	user_2 = {}

	context "\b: When the user is not logged in" do

	 	context "\b, a GET request to the 'index' methtod" do
	 		before do
	 			get :index
	 		end

	 	 	it "should redirect to the 'new_user_session_path'" do
				response.response_code.should == 302
				response.should redirect_to new_user_session_path
			end

	 	end
	 	
	 	context "\b, a GET request to the 'new' method" do
	 		before do
	 			get :new
	 		end

	 	 	it "should redirect to the 'new_user_session_path'" do
				response.response_code.should == 302
				response.should redirect_to new_user_session_path
			end

	 	end
	 	context "\b, a GET request to the 'create' method" do
	 		before do
	 			get :create
	 		end

	 		it "should redirect to the 'new_user_session_path'"do
				response.response_code.should == 302
				response.should redirect_to new_user_session_path	 			
	 		end
	 	end
	end

	context "\b: When the user is logged in" do
		before do
			@user_1 = FactoryGirl.create(:user_with_all_valid)
			sign_in @user_1
		end
		context "\b, and a second user exists" do
			before do
				@user_2 = FactoryGirl.create(:user_with_all_valid_two)
			end
			
			context "\b, and a third user exists" do
				before do
					@user_3 = FactoryGirl.create(:user_with_all_valid_three)
				end

				context "\b, and a relationship exists" do
					before do

						@friendship_1 = FactoryGirl.create(:pending_user_friendship, user_id: @user_1.id, friend_id: @user_2.id)
						puts "-----------------------Friendship:-----------------------"
						ap @friendship_1
						puts "------- True Friends ---------"
						ap @user_1.friends
						puts "--- Pending Friends ---"
						ap @user_1.pending_friends
						puts "-end-"

						get :index
					end

					it "should set the HTTP response to 200" do
						response.response_code.should == 200
					end

					it "should be successful" do
						response.should be_successful
					end
		
					it "should populate pending_friends" do
						@user_1.pending_friends.should include(@user_2)
					end

					it "should not populate friends" do
						@user_1.friends.should_not include(@user_2)				
					end

					it "should assign not @user_friendship" do
						assigns[:user_friendships].should_not include(@user_2)
						assigns[:user_friendships].should == []	
					end	

				end

				context "\b, and an accepted relationship exists" do
					before do
						# note the overrides from the original factory 
						@friendship_2 = FactoryGirl.create(:accepted_user_friendship, user_id: @user_1.id, friend_id: @user_2.id)

						puts "-----------------------Friendship:-----------------------"
						ap @friendship_2
						puts "------- True Friends ---------"
						ap @user_1.friends
						puts "--- Pending Friends ---"
						ap @user_1.pending_friends
						puts "-end-"

#						@friendship_2 = FactoryGirl.create(:accepted_user_friendship, user: @user_1, friend: @user_2)
						get :index

					end

					it "should set the HTTP response to 200" do
						response.response_code.should == 200
					end

					it "should be successful" do
						response.should be_successful
					end
					
					# model tests start
					it "should not populate pending_friends" do
						@user_1.pending_friends.should_not include(@user_2)				
					end

					it "should populate friends" do
						@user_1.friends.should include(@user_2)
					end
					# model tests end
				
		
					it "should assign @user_friendships" do
						assigns[:user_friendships].should include(@user_2)
					end	

					it "should display profile name in view" do
						pending('Need headless server')
					end

				end

				context "\b, a GET request to the 'new' method with a valid friend_id" do
					before do
						get :new, friend_id: "Ratexcellent"
					end

					it "should set the HTTP response to 200" do
						response.response_code.should == 200
					end

					it "should be successful" do
						response.should be_successful
					end

					it "should render a template" do
						response.should render_template('new')
					end

					it "should have an empty flash message" do
						flash[:notice].should == nil
					end
				end

				context "\b, a POST request to the 'create' method with a valid friend_id" do
					before do
						get :create, friend_id: "Ratexcellent"
					end

					it "should have that friend assigned to @friend" do
						assigns[:friend].should == @user_2
					end

					it "should assign user_friendship" do
						assigns[:user_friendship].user.should == @user_1
						assigns[:user_friendship].friend.should == @user_2 
					end

					it "should respond with a HTTP response of 302" do
						# redirects to the profile pages
						response.response_code.should == 302
					end

					it "should respond with a redirect" do
						response.should be_redirect
					end

					it "should redirect to the profile_path" do
						post :create, friend_id: "Chipboy76"
					    response.should redirect_to profile_path
					end

					it "should have an empty flash message" do
						flash[:notice].should == nil
					end

					it "should have friends successfully assigned to it" do
						@user_1.friends[0].should == @user_2
					end


					context "\b, and another POST request to the 'create' method with a valid friend_id (user_3)" do
						before do
						#	post :create, friend_id: @user_3.profile_name
						end

						it "should have that friend assigned to @friend" do
							assigns[:friend].should == @user_3
						end
							
						it "should assign user_friendship" do
							assigns[:user_friendship].user.should == @user_1
							assigns[:user_friendship].friend.should == @user_3 
						end

						it "should set the HTTP response to 200" do
							response.response_code.should == 200
						end

						it "should be successful" do
							response.should be_successful
						end

						it "should render a template" do
							response.should render_template('create')
						end

						it "should have an empty flash message" do
							flash[:notice].should == nil
						end

						it "should have friends successfully assigned to it" do
							@user_1.friends.should == @user_3
						end
					end

				end

				context "\b, a POST request to the 'create' method with an invalid friend_id" do
					before do
						post :create, friend_id: "user_that_does_not_exist_3434"
					end

					it "should set the flash error message" do
						flash[:error].should_not == nil
					end

					it "should set the HTTP response to 302" do
						response.response_code.should == 302
					end

					it "should redirect to the site root" do
						response.should redirect_to root_path
					end
				end

				context "\b, a POST request to the 'create' method with no friend_id" do
					before do
						post :create
					end
					
					#assigns[:friend].profile_name.should == "Chipboy76"
					#:friend is refering to a @friend in the view
			
					it "should set the flash error message" do
						flash[:error].should_not == nil
					end

					it "should set the HTTP response to 302" do
						response.response_code.should == 302
					end

					it "should redirect to the site root" do
						response.should redirect_to root_path
					end
				end
				
			end
		end
	end
	
	context "\b: When a user is logged in" do
		before do
			# devise helper method
			user_1 = FactoryGirl.create(:user_with_all_valid)
			user_2 = FactoryGirl.create(:user_with_all_valid_two)
			sign_in user_1
		end

		it "should respond with a 404 page with an empty request" do
			get :new
			response.response_code.should == 404
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

####
# CONTEXT START
####
		context "\b, a valid GET request for a valid user" do
			before do 
				#########
				# And I'm going to just go ahead and leave off the ".ID" part right there.
				# Rails will automatically add it for me.
				# This must mean( get :new, friend_id: user_2.id ==  get :new, friend_id: user_2 )
				#########	
			
				get :new, friend_id: user_2
			end

			it "should ask the current user if they are sure they wish to create a friendship with the requested user" do
				
				pending "Can't install headless server on mac"

				page.should have_content("Are you sure you want to add this user as a friend")
			end
		end
####
# CONTEXT END
####

		it "assigns @teams" do
			get :new, friend_id: user_2.profile_name
			assigns[:friend].profile_name.should == "Chipboy76"
			# :friend is refering to a @friend in the view
		end

		it "assings @user_friendship between user_1 and user_2" do
			get :new, friend_id: user_2.profile_name
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
=end
#end