=begin
require 'test_helper'
class UserFriendshipDecoratorTest < Draper::TestCase
end
=end

require 'spec_helper'
require 'ap'

describe UserFriendshipDecorator do
	context "with pending user friendship" do
		before do
        	@user_friendship_1 = FactoryGirl.create(:pending_user_friendship)
            @user_friendship_1.reload		
       	end

       	context "" do
	       	before do
	    	    @decorator_1 = UserFriendshipDecorator.decorate(@user_friendship_1)
	       	end

			it "should have #sub_message" do
				expect { @decorator_1.sub_message }.to_not raise_error
			end
			
			it "should have a friendship_state method" do
				expect { @decorator_1.friendship_state }.to_not raise_error
			end
			
			it "should return 'Pending'" do
				@decorator_1.friendship_state.should == "Pending"
			end

	    end
	end

	context "with accepted user friendship" do
		before do
        	@user_friendship_1 = FactoryGirl.create(:accepted_user_friendship)
            @user_friendship_1.reload		
       	end

       	context "" do
	       	before do
	    	    @decorator_1 = UserFriendshipDecorator.decorate(@user_friendship_1)
	       	end
			
			it "should have a friendship_state method" do
				expect { @decorator_1.friendship_state }.to_not raise_error
			end
			
			it "should return 'Accepted'" do
				@decorator_1.friendship_state.should == "Accepted"
			end

			context "#sub_message" do
				before do
				end

				it "should return the correct message" do
					@decorator_1.sub_message.should == "<h3> You are friends with Jim. </h3>"
				end
			end
	    end
	end
	

	context "with a requested user friendship" do
		before do
        	@user_friendship_1 = FactoryGirl.create(:requested_user_friendship)
            @user_friendship_1.reload		
       	end

       	context "" do
	       	before do
	    	    @decorator_1 = UserFriendshipDecorator.decorate(@user_friendship_1)
	       	end
			
			it "should have a friendship_state method" do
				expect { @decorator_1.friendship_state }.to_not raise_error
			end
			
			it "should return 'Requested'" do
				@decorator_1.friendship_state.should == "Requested"
			end

			context "#sub_message" do
				before do
				end

				it "should return the correct message" do
					@decorator_1.sub_message.should == "<h3> Do you really want to be friends with Mary?</h3>"
				end
			end
	    end
	end


end