require 'rails_helper'

RSpec.describe "Words", type: :request do

  let(:valid_attributes) {
    {
      word_name: "validName",
      word_class: "validClass"
    }
  }

  let(:invalid_attributes) {
    {
      word_name: nil,
      word_class: nil
    }
  }

  let(:bad_word_id) { 999 }

  describe "GET /words" do

    context "with no words present" do

      before do
        get words_path
      end

      it "has success response" do
        expect(response).to have_http_status 200
      end

      it "has correct content type" do
        expect(response.content_type).to eq "application/json"
      end

      it "response is empty" do
        expect(json).to be_empty
        expect(json.length).to eq 0
      end

    end

    context "with 10 words present" do

      before do
        create_list(:word, 10)
        get words_path
      end

      it "has success response" do
        expect(response).to have_http_status 200
      end

      it "has correct content type" do
        expect(response.content_type).to eq "application/json"
      end

      it "returns words" do
        expect(json).not_to be_empty
        expect(json.length).to eq 10
      end

    end

  end

  describe "GET /words/:id" do

    context "with word not present" do

      before do
        get word_path bad_word_id
      end

      it "has failure response" do
        expect(response).to have_http_status 404
      end

      it "has correct content type" do
        expect(response.content_type).to eq "application/json"
      end

      it "response is empty" do
        expect(json).to be_empty
        expect(json.length).to eq 0
      end

    end

    context "with word present" do

      before do
        @test_word = create(:word)
        get word_path @test_word
      end

      it "has success response" do
        expect(response).to have_http_status 200
      end

      it "has correct content type" do
        expect(response.content_type).to eq "application/json"
      end

      it "returns word" do
        expect(json).not_to be_empty
        expect(json['id']).to eq @test_word.id
      end

    end

  end

  describe "POST /words" do

    context "when word has valid attributes" do

      before do
        post words_path, params: { word: valid_attributes }
      end

      it "has success response" do
        expect(response).to have_http_status 201
      end

      it "has correct content type" do
        expect(response.content_type).to eq "application/json"
      end

      it "creates the correct word" do
        expect(json['word_name']).to eq valid_attributes[:word_name]
      end

    end

    context "when word has invalid attributes" do

      before do
        post words_path, params: { word: invalid_attributes }
      end

      it "has failure response" do
        expect(response).to have_http_status 422
      end

      it "has correct content type" do
        expect(response.content_type).to eq "application/json"
      end

      it "returns error response" do
        expect(json).not_to be_empty
      end

    end

  end

  describe "PATCH /words/:id" do

    context "when updating word that exists with valid attributes" do

      let(:updated_attributes_valid) {
        {
          word_name: "UpdatedTestName",
          word_class: "UpdatedTestClass"
        }
      }

      before do
        @test_word = create(:word)
        patch word_path @test_word, params: { word: updated_attributes_valid }
      end

      it "has success response" do
        expect(response).to have_http_status 200
      end

      it "has correct content type" do
        expect(response.content_type).to eq "application/json"
      end

      it "word is updated" do
        expect(json['word_name']).to eq updated_attributes_valid[:word_name]
        expect(json['word_class']).to eq updated_attributes_valid[:word_class]
      end

    end

    context "when updating word that exists with invalid attributes" do

      let(:updated_attributes_invalid) {
        {
          word_name: "",
          word_class: ""
        }
      }

      before do
        @test_word = create(:word)
        patch word_path @test_word, params: { word: updated_attributes_invalid }
      end

      it "has error response" do
        expect(response).to have_http_status 422
      end

      it "has correct content type" do
        expect(response.content_type).to eq "application/json"
      end

      it "returns error response" do
        expect(json).not_to be_empty
      end

    end

    context "when updating word that doesn't exist" do

      let(:updated_attributes_valid) {
        {
          word_name: "UpdatedTestName",
          word_class: "UpdatedTestClass"
        }
      }

      before do
        patch word_path bad_word_id, params: { word: updated_attributes_valid }
      end

      it "has error response" do
        expect(response).to have_http_status 404
      end

      it "has correct content type" do
        expect(response.content_type).to eq "application/json"
      end

      it "has empty response" do
        expect(json).to be_empty
      end

    end

  end

  describe "DELETE /words/:id" do

    context "when word exists" do

      before do
        @test_word = create(:word)
        delete word_path @test_word
      end

      it "has success response (no content)" do
        expect(response).to have_http_status 204
      end

    end

    context "when word doesn't exists" do

      before do
        delete word_path bad_word_id
      end

      it "has error response" do
        expect(response).to have_http_status 404
      end

      it "has correct content type" do
        expect(response.content_type).to eq "application/json"
      end

      it "has empty response" do
        expect(json).to be_empty
      end

    end

  end

end
