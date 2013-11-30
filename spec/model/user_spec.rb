require 'spec_helper'

RSpec::Matchers.define :be_valid do
  match do |actual|
    actual.valid?
  end

  failure_message_for_should do |actual|
    "expected that #{actual} would be valid (errors: #{actual.errors.full_messages.inspect})"
  end

  failure_message_for_should_not do |actual|
    "expected that #{actual} would not be valid"
  end

  description do
    "be valid"
  end
end

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
	
	describe User, user_with_all_valid: true do
		context "all valid attributes"	do
			subject { @user }

			it { should be_valid }
			its(:first_name) { should == "Jimmy" }
			its(:last_name) { should == "Thehat" }
			its(:profile_name) { should == "Jimbohatboy893" }
			its(:email) { should == "awesomedog@hotmail.co.uk" }
			its(:password) { should == "thisisasupersecretpassword12234234" }
			its(:password_confirmation) { should == "thisisasupersecretpassword12234234" }
		end

		# validations 
		context "blank first_name" do
			let (:first_name) {""}

			it { should_not be_valid }
=begin
			its(:first_name) { should == nil }
			its(:last_name) { should == nil }
			its(:profile_name) { should == nil }
			its(:email) { should == nil }
			its(:password) { should == nil }
			its(:password_confirmation) { should == nil }
=end
		end
		context "blank last_name" do
			let (:last_name) {""}
			it { should_not be_valid }
		end
		context "blank profile_name" do
			let (:profile_name) {""}
			it { should_not be_valid }
		end
		context "blank email" do
			let (:email) {""}
			it { should_not be_valid }
		end
		context "blank password" do
			let (:password) {""}
			it { should_not be_valid }
		end
		context "blank password_confirmation" do
			let (:password_confirmation) {""}
			it { should_not be_valid }
		end
		context "mismatched password_confirmation" do
			let(:password_confirmation) { "thisisasupersecretpassword12234234____and_some_extra_strings" }
			it { should_not be_valid }
		end
	end
end
