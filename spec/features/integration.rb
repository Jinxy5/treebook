require 'spec_helper'
describe "Routes" do
	describe "GET requests", js: true do
        it "can create a user" do
            it "does another" do
                
            end
        end
        it "GET /root_path" do
            visit root_path
            page.should have_content("All of our statuses")
            click_link "Post a New Status"
            page.should have_content("New status")
            fill_in "status_content", with: "Oh my god I am going insaaaaaaaaane!!!"
            click_button "Create Status"
            page.should have_content("Status was successfully created.")
            click_link "Statuses"
            page.should have_content("All of our statuses")                        page.should have_content("Jimmy balooney")
            page.should have_content("Oh my god I am going insaaaaaaaaane!!! ")
        end
	end
end