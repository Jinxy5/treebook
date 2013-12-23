require "spec_helper"
=begin
USE THE STUB_MODEL METHOD TO POPULATE INSTANCE VARIABLES FOR THE VIEW
The stub_model method generates an instance of a Active Model model.

While you can use stub_model in any example (model, view, controller,
helper), it is especially useful in view examples, which are inherently
more state-based than interaction-based.

To emulate a databasw queries results, you can populate an instance variable like this:

Let's say you wanted to populate "@widgets", and emulate an
action's database query:

def view
	@widgets = where(type: 'dog')
end

You would do the following:

describe "widgets/index.html.erb" do
  it "displays all the widgets" do
    assign(:widgets, [
      stub_model(Widget, :name => "slicer", type: "dog"),
      stub_model(Widget, :name => "dicer", type: "dog")
    ])

    render

    rendered.should contain("slicer")
    rendered.should contain("dicer")
  end
end

	#  the following assings @widgets with an array, just like a datbase query
	# NOTE
	#
	# we could use an active record statement 
	# assign(:widgets, Users.find_by)
	#
	#    assign(:widgets, [
	#      stub_model(Widget, :name => "slicer"),
	#      stub_model(Widget, :name => "dicer")
	#    ])
=end
describe "profiles/show.html.erb" do
	include Devise::TestHelpers

	context "\b:" do
		before do
		end
		after do
		end

		context "With users and statuses" do
			before do
				@user_0 = FactoryGirl.build(:user_0)					
				@user_1 = FactoryGirl.build(:user_1)
				@user_2 = FactoryGirl.build(:user_2)					
				@user_3 = FactoryGirl.build(:user_3)

				@user_0_status_0 = FactoryGirl.build(:user_0_status_0)
	     		@user_0_status_1 = FactoryGirl.build(:user_0_status_1)
	     		@user_0_status_2 = FactoryGirl.build(:user_0_status_2)
	     		@user_0_status_3 = FactoryGirl.build(:user_0_status_3) 
			end

			context "\b, while in no session" do
				before do
				end
				
				it "" do
				end
			end

			context "\b, while in a user_0 session" do
				before do
					sign_in @user_0
				end

				context "\b, with @statuses assigned" do
					before do
	   					@statuses = [@user_0_status_0,
	   								 @user_0_status_1,
	   								 @user_0_status_2,
	   								 @user_0_status_3
	     							]
					end

					context "\b, with @profile assigned to user_0" do
						before do
		   					@profile = @user_0
						end

						it "should display all four statuses' content" do
							render

						    rendered.should contain(@user_0_status_0.content)
						    rendered.should contain(@user_0_status_1.content)
						    rendered.should contain(@user_0_status_2.content)
						    rendered.should contain(@user_0_status_3.content)
						end
					end
				end
			end
		end
	end
end