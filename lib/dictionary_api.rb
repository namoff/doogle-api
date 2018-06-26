module DictionaryApi

  def dictionary_api_search word_name
    parse_dictionary_response HTTParty.get(
      'http://www.dictionaryapi.com/api/v1/references/collegiate/xml/' +
      word_name +
      '?key=' +
      Rails.application.credentials.dictionary_api[:key]
    )
  end

  def parse_dictionary_response response
    parsed_words = []
    Nokogiri::XML(response.body).xpath('//entry').each do |entry|
      word = {
        word_name: entry.xpath('ew').text,
        word_class: entry.xpath('fl').text,
        definitions: []
      }
      entry.xpath('def/dt').each do |dt|
        word[:definitions].push(dt.text.gsub(/:/, ''))
      end
      parsed_words.push word
    end
    parsed_words
  end

end
