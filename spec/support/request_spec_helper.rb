module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end

  def stub_get_dictionary_api_success word_name
    stub_request(:get, /dictionaryapi/).
       with(
         headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Ruby'
         }).
       to_return(status: 200, body: "<?xml version=\"1.0\" encoding=\"utf-8\" ?>\r\n<entry_list version=\"1.0\">\n\t<entry id=\"" + word_name + "\"><ew>" + word_name + "</ew><fl>noun</fl><dt>" + Faker::Lorem.sentence + "</dt></def></entry>\r\n</entry_list>", headers: {})
  end

  def stub_get_dictionary_api_fail
    stub_request(:get, /dictionaryapi/).
       with(
         headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Ruby'
         }).
       to_return(status: 404, body: "", headers: {})
  end

end
