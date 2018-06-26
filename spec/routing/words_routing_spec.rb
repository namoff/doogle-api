require "rails_helper"

RSpec.describe WordsController, type: :routing do
  describe "routing" do

    it "routes to #search" do
      expect(:get => "/test").to route_to("words#search", word_name: "test")
    end

  end
end
