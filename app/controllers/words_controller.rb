class WordsController < ApplicationController
  include DictionaryApi
  before_action :set_words

  def search
    if @words.any?
      render json: @words
    else
      dictionary_words = dictionary_api_search @word_name.parameterize(separator: '+')
      if dictionary_words.any?
        dictionary_words.each do |word|
          Word.create! word
        end
        render json: dictionary_words
      else
        render json: {}, status: :not_found
      end
    end
  end

  private
    def set_words
      @word_name = params[:word_name] || ""
      @words = Word.where("word_name like ?", "%#{@word_name}%" )
    end

end
