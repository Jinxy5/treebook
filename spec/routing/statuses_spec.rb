=begin
require 'spec_helper'

describe "route" do

    it "' /statuses ' routes to statuses#index" do
      	get("/statuses").should route_to(controller: "statuses", action: "index")
    end

    it "' /statuses ' routes to statuses#index" do
      	post("/statuses").should route_to(controller: "statuses", action: "create")
    end

    it "' /statuses/new ' routes to statuses#index" do
      	get("/statuses/new").should route_to(controller: "statuses", action: "new")
    end

    it "' /statuses/1/edit ' routes to statuses#index" do
      	get("/statuses/1/edit").should route_to(controller: "statuses", action: "edit", id: "1")
    end

    it "' /statuses/1 ' routes to statuses#index" do
      	get("/statuses/1").should route_to(controller: "statuses", action: "show", id: "1")
    end

    it "' /statuses/1 ' routes to statuses#index" do
      	patch("/statuses/1").should route_to(controller: "statuses", action: "update", id: "1")
    end

    it "' /statuses/1 ' routes to statuses#index" do
      	put("/statuses/1").should route_to(controller: "statuses", action: "update", id: "1")
    end

    it "' /statuses/1 ' routes to statuses#destroy" do
      	delete("/statuses/1").should route_to(controller: "statuses", action: "destroy", id: "1")
    end

    it "' / ' routes to statuses#destroy" do
      	get("/").should route_to(controller: "statuses", action: "index")
    end
end
=end