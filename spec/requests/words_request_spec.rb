require 'rails_helper'

RSpec.describe "Words", type: :request do

  describe "GET /words/:id" do

    context "with invalid word" do

      let(:invalid_word_name) { Faker::Lorem.word }

      before do
        stub_get_dictionary_api_fail
        get word_path invalid_word_name
      end

      it "has failure response" do
        expect(response).to have_http_status 404
      end

      it "has correct content type" do
        expect(response.content_type).to eq "application/json"
      end

      it "response is empty" do
        expect(json).to be_empty
      end

    end

    context "with valid word" do

      before do
        @valid_word = create(:word)
        get word_path @valid_word.word_name
      end

      it "has success response" do
        expect(response).to have_http_status 200
      end

      it "has correct content type" do
        expect(response.content_type).to eq "application/json"
      end

      it "returns word" do
        expect(json.first['id']).to eq @valid_word.id
      end

    end

  end

end
