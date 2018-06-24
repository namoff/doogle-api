class WordsController < ApplicationController
  include DictionaryApi
  before_action :set_words


  #GET /words
  # def index
  #   @words = Word.all
  #   render json: @words, status: :ok
  # end

  # GET /words/1


  # something like:
  # => render words
  # => else save and render API return
  # => else return 404

  def show
    if @words.any?
      render json: @words
    else
      dictionary_words = dictionary_api_search @word_name
      if dictionary_words.any?
        dictionary_words.each do |word|
          Word.create!(word)
        end
        render json: dictionary_words
      else
        render json: {}, status: :not_found
      end
    end
  end

  #POST /words
  # def create
  #   @word = Word.new(word_params)
  #
  #   if @word.save
  #     render json: @word, status: :created, location: @word
  #   else
  #     render json: {}, status: :unprocessable_entity
  #   end
  # end

  #PATCH/PUT /words/1
  # def update
  #   if @word.nil?
  #     render json: {}, status: :not_found
  #   elsif @word.update(word_params)
  #     render json: @word
  #   else
  #     render json: @word.errors, status: :unprocessable_entity
  #   end
  # end

  #DELETE /words/1
  # def destroy
  #   if @word.nil?
  #     render json: {}, status: :not_found
  #   else
  #     @word.destroy
  #   end
  # end

  private
    def set_words
      @word_name = params[:id]
      @words = Word.where(word_name: params[:id]).order(:word_name)
      # rescue ActiveRecord::RecordNotFound
      #   @words = []
    end

    # def word_params
    #   params.require(:word).permit(
    #     :word_name,
    #     :word_class,
    #     :definitions
    #   )
    # end
end
