
describe "thing" do
		
	context "friendship exists" do
		before do
			@user_1 = 12
			@user_2 = 24				
		end
		context "" do
			before do
			end
			context "" do
				before do
				end

				context "something else" do
					before do
					end

					it "should work" do
						@user_1.should == @user_2	
					end
				end
			end
		end
	end
	
	context "\b: When four valid User instances exist, @user_1, @user_2, @user_3, @user_4" do
		before do
			@user_friendship_1 = 34
		end

		context "\b, and when logged in as @user_1" do
			before do
			end

			context "\b, and when a UserFriendship, @user_friendship_1, is joining @user_1 with @user_2" do
				before do

				end


				context "\b, a PATCH request to the #edit action with the :id of @user_friendship_1" do
					before do
						@user_friendship_1 = 90
						@user_friendship_2 = 90
					end


					it "should assign @user_friendship_1 to the instance variable #|@user_friendship_1|" do
						@user_friendship_2.should_not == @user_friendship_1
					end
				end
			end		
		end
	end
end