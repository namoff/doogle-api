# module DictionaryApi
#
#   def dictionary_api_search word_name
#     HTTParty.get(
#       'http://www.dictionaryapi.com/api/v1/references/collegiate/xml/' +
#       word_name +
#       '?key=' +
#       Rails.application.credentials.dictionary_api[:key]
#     )
#   end
#
# end
