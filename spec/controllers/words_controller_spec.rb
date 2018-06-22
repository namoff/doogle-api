require 'rails_helper'

RSpec.describe WordsController, type: :controller do

  # let(:valid_attributes) {
  #   {
  #     word_name: Faker::Lorem.word,
  #     word_class: Faker::Lorem.word,
  #     definitions: [Faker::Lorem.sentence]
  #   }
  # }
  #
  # let(:invalid_attributes) {
  #   {
  #     word_name: nil,
  #     word_class: nil,
  #     definitions: nil
  #   }
  # }

  # let(:bad_word_id) { 999 }

  # describe "searching for all words" do
  #
  #   before do
  #     @words = FactoryBot.create_list :word, 10
  #   end
  #
  #   it "gets all words" do
  #     get :index
  #     expect(assigns(:words)).to eq @words
  #   end
  # end
  #
  # describe "creating a new word" do
  #
  #   context "that is valid" do
  #     it "updates the word count" do
  #       expect {
  #         post :create, params: { word: valid_attributes }
  #       }.to change(Word, :count).by(1)
  #     end
  #   end
  #
  #   context "that is invalid" do
  #     it "doesn't update the word count" do
  #       expect {
  #         post :create, params: {word: invalid_attributes}
  #       }.to change(Word, :count).by(0)
  #     end
  #   end
  #
  # end
  #
  # describe "deleting a word" do
  #
  #   context "when the word exists" do
  #     it "updates the word count" do
  #       word = Word.create! valid_attributes
  #       expect {
  #         delete :destroy, params: {id: word.to_param}
  #       }.to change(Word, :count).by(-1)
  #     end
  #   end
  #
  #   context "when the word doesn't exist" do
  #     it "doesn't update the word count" do
  #       expect {
  #         delete :destroy, params: {id: bad_word_id}
  #       }.to change(Word, :count).by(0)
  #     end
  #   end
  #
  # end

  describe "searching for a word" do

    context "in the database" do

      it "returns the word" do
        @word_in_database = create :word
        get :show, params: { id: @word_in_database.word_name }
        expect(assigns(:words)).to include @word_in_database
      end
    end

    context "not in the database" do

      describe "but in DictionaryAPI" do

        before :each do
          @word_name_in_api = 'catacomb'
          stub_get_dictionary_api_catacomb
          get :show, params: { id: @word_name_in_api }
        end

        it "is successful" do
          expect(response).to be_successful
        end

        it "returns the word" do
          expect(assigns(:words).first.word_name).to eq @word_name_in_api
        end

        it "saves the word" do
          expect(Word.find_by_word_name(@word_name_in_api).word_name).to eq @word_name_in_api
        end

      end

      describe "and not in DictionaryAPI" do

        before do
          @word_name_doesnt_exist = 'worddoesntexist'
          stub_get_dictionary_api_worddoesntexist
          get :show, params: { id: @word_name_doesnt_exist }
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
