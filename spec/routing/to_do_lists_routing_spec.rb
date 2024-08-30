require "rails_helper"

RSpec.describe ToDoListsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/to_do_lists").to route_to("to_do_lists#index")
    end

    it "routes to #new" do
      expect(get: "/to_do_lists/new").to route_to("to_do_lists#new")
    end

    it "routes to #show" do
      expect(get: "/to_do_lists/1").to route_to("to_do_lists#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/to_do_lists/1/edit").to route_to("to_do_lists#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/to_do_lists").to route_to("to_do_lists#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/to_do_lists/1").to route_to("to_do_lists#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/to_do_lists/1").to route_to("to_do_lists#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/to_do_lists/1").to route_to("to_do_lists#destroy", id: "1")
    end
  end
end
