
require 'spec_helper'

describe Status do

	context "Attributes can be created to and read from the status table succesfully" do
		status = FactoryGirl.create(:status_one)

		subject { status }

		its(:name) { should == "Here is numerano Uno Status!"}
		its(:content) { should == "This is definitely the number one status! One, as in 1!"}
	end
end