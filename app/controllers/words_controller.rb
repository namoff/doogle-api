class WordsController < ApplicationController
  include DictionaryApi
  before_action :set_words


  #GET /words
  # def index
  #   @words = Word.all
  #   render json: @words, status: :ok
  # end

  # GET /words/1
  def show
    if @words.any?
      render json: @words
    else
      new_words = []
      dictionary_response = dictionary_api_search @word_name
      xml = Nokogiri::XML(dictionary_response.body)

      if xml.xpath('//entry').empty?
        render json: {}, status: :not_found
      else
        xml.xpath('//entry').each do |entry|
          new_word = Word.new
          new_word[:word_name] = entry.xpath('ew').text
          new_word[:word_class] = entry.xpath('fl').text

          entry.xpath('//dt').each do |dt|
            new_word[:definitions].push(dt.text.gsub(/:/, ''))
          end
          new_word.save!
          new_words.push new_word
        end

        render json: new_words
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
