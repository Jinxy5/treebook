require 'spec_helper'

describe "Routes" do
	describe "GET requests", js: true do
                it "GET /root_path" do
                	visit root_path
                        page.should have_content("All of our statuses")
                        click_link "Post a New Status"
                        page.should have_content("New status")
                        fill_in "status_name", with: "Jimmy balooney"
                        fill_in "status_content", with: "Oh my god I am going insaaaaaaaaane!!!"
                        click_button "Create Status"
                        page.should have_content("Status was successfully created.")
                        click_link "Statuses"
                        page.should have_content("All of our statuses")
                        page.should have_content("Jimmy balooney")
                        page.should have_content("Oh my god I am going insaaaaaaaaane!!! ")
                end

                it "supports js", js: true do
                        visit root_path
                        click_link "JS HERE"
                        page.should have_content("js works")
                end
	end
end