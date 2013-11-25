require 'spec_helper'

describe "Routes" do
	describe "GET requests" do
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
        save_and_open_page
	    end
	end
end
=begin

    it "GET /get new_user_registration_path" do
    	get new_user_registration_path
    	response.status.should be(200)
    end

    it "GET /statuses_path" do
    	get statuses_path
    	response.status.should be(200)
    end


=begin
statuses


	it "GET /teo" do
    	get status_path(3)
    	response.status.should be(200)
    end
	it "GET /routes" do
    	get edit_status_path
    	response.status.should be(200)
    end

	it "GET /routes" do
    	get new_status_path
    	response.status.should be(200)
    end

	it "GET /routes" do
    	get statuses_path
    	response.status.should be(200)
    end

	it "GET /routes" do
    	get edit_user_registration_path
    	response.status.should be(200)
    end



	it "GET /routes" do
    	get edit_user_registration_path
    	response.status.should be(200)
  	end
end
        new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
          
       new_user_password GET    /users/password/new(.:format)  devise/passwords#new
      edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
          r_registration GET    /users/cancel(.:format)        devise/registrations#cancel
       user_registration GET    /users/sign_up(.:format)       devise/registrations#new
  edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
                statuses GET    /statuses(.:format)            statuses#index
              new_status GET    /statuses/new(.:format)        statuses#new
             edit_status GET    /statuses/:id/edit(.:format)   statuses#edit
                  status GET    /statuses/:id(.:format)        statuses#show
                    root GET    /   



describe "Routes" do
  describe "GET /routes" do
    it "works!" do
      get root_path
      response.status.should be(200)
    end
  end
end
=end

