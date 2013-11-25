require 'spec_helper'

describe StatusesController do
	describe "routing" do
    it "routes to #index" do
      get("/statuses")
      response.should route_to("statuses#show")
      response.status.should be(200)
    end
=begin
    it "routes to #show" do
      get("/statuses/1")
      response.status.should be(200)
    end
=end
  end
end