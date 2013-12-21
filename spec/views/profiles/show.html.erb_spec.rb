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

		context "With four users" do
			before do
				# .create means 'create' the instance in the database .build means 'build' the instance in memory.
				# note that build simply creates the hash in memory, where as create writes it to the database through
				# active record. Acrive record will go ahead and automatically populate fields such as id, created_at and updated_at
				# whereas you will need to populate these fields yourself (specify them in your factory, make sure the ids are different)
				# when building
			#	@user_1 = FactoryGirl.create(:user_4)
			#	@user_1.reload
					
			#	@user_2 = FactoryGirl.create(:user_5)
			#	@user_2.reload
					
			#	@user_3 = FactoryGirl.create(:user_6)
			#	@user_3.reload

			#	@user_4 = FactoryGirl.create(:user_7)
			#	@user_4.reload
			end

			context "\b, no session" do
				before do
				end
				
				it "" do
				end
			end

			context "\b, a session" do
				before do
#					sign_in @user_1
				end

				context "\b, and" do
					before do
					#	sign_in @user_1
						# these instance variables are carried on into the view!
	   					@statuses = [FactoryGirl.create(:user_4_status_0),
	     							 FactoryGirl.create(:user_4_status_1),
	     							 FactoryGirl.create(:user_4_status_2),
	     							 FactoryGirl.create(:user_4_status_3),
	     							 FactoryGirl.create(:user_4_status_4),
	     							 FactoryGirl.create(:user_4_status_5),
	     							 FactoryGirl.create(:user_4_status_6)
	     							]
					#	@profile = @user_1
					end

					it "" do
 
					end
					


					it "" do
						render

					    rendered.should contain("hello")
					    rendered.should contain("hello")
					end
				end
			end
		end
	end
end