require "rails_helper"

RSpec.describe Project::StepsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/project/steps").to route_to("project/steps#index")
    end

    it "routes to #new" do
      expect(:get => "/project/steps/new").to route_to("project/steps#new")
    end

    it "routes to #show" do
      expect(:get => "/project/steps/1").to route_to("project/steps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/project/steps/1/edit").to route_to("project/steps#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/project/steps").to route_to("project/steps#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/project/steps/1").to route_to("project/steps#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/project/steps/1").to route_to("project/steps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/project/steps/1").to route_to("project/steps#destroy", :id => "1")
    end

  end
end
