module DictionaryApi

  def dictionary_api_search word_name
    endpoint = 'http://www.dictionaryapi.com/api/v1/references/collegiate/xml/'
    key_text = '?key='
    key_code = Rails.application.credentials.dictionary_api[:key]
    HTTParty.get(endpoint + word_name + key_text + key_code)
  end

end
