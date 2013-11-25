require 'spec_helper'

describe User do
	context "A new user can be created" do
		user = FactoryGirl.create(:user_one)

		subject { user }
		its(:first_name) { should == "Jimmy" }
		its(:last_name) { should == "Thehat" }
		its(:profile_name) { should == "Jimbohatboy893" }
		its(:email) { should == "awesomedog@hotmail.co.uk" }
		its(:password) { should == "thisisasupersecretpassword12234234" }
		its(:password_confirmation) { should == "thisisasupersecretpassword12234234" }
	end
end