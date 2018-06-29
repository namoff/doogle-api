require "rails_helper"

RSpec.describe WordsController, type: :routing do
  describe "routing" do

    it "routes to #search" do
      expect(:post => "/").to route_to("words#search")
    end

  end
end
