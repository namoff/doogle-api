require 'rails_helper'

RSpec.describe WordsController, type: :controller do

  describe "searching for a word" do

    context "in the database" do

      before do
        @word_in_database = create :word
        get :search, params: { word_name: @word_in_database.word_name }
      end

      it "returns the word" do
        expect(assigns(:words)).to include @word_in_database
      end
    end

    context "not in the database" do

      describe "but in DictionaryAPI" do

        let(:word_name_in_api) { Faker::Lorem.word }

        before do
          stub_get_dictionary_api_success word_name_in_api
          get :search, params: { word_name: word_name_in_api }
        end

        it "is successful" do
          expect(response).to be_successful
        end

        it "returns the word" do
          expect(assigns(:words).first.word_name).to eq word_name_in_api
        end

        it "saves the word" do
          expect(Word.find_by_word_name(word_name_in_api).word_name).to eq word_name_in_api
        end

      end

      describe "and not in DictionaryAPI" do

        let(:word_name_doesnt_exist) { Faker::Lorem.word }

        before do
          stub_get_dictionary_api_fail
          get :search, params: { word_name: word_name_doesnt_exist }
        end

        it "is not successful" do
          expect(response).to_not be_successful
        end

        it "returns nothing" do
          expect(assigns(:words)).to be_empty
        end

      end

    end

  end

end
