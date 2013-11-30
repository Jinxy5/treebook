require 'spec_helper'

describe User do



  	before(:each) do
	  if example.metadata[:user_with_all_valid]
		set(:user_with_all_valid) 
	  elsif example.metadata[:user_with_all_valid_2]
		set(:user_with_all_valid_2) 
	  elsif example.metadata[:user_with_no_attributes]
		set(:user_with_no_attributes)		
	  end 
    end
	
	describe "A new valid user can be created", user_with_all_valid: true do
	
		subject { @user }

		its(:first_name) { should == "Jimmy" }
		its(:last_name) { should == "Thehat" }
		its(:profile_name) { should == "Jimbohatboy893" }
		its(:email) { should == "awesomedog@hotmail.co.uk" }
		its(:password) { should == "thisisasupersecretpassword12234234" }
		its(:password_confirmation) { should == "thisisasupersecretpassword12234234" }
	end

	describe "A user cannot be created with no", user_with_no_attributes: true do

		subject { @user }
		it { should not_be_valid }

	end
end
