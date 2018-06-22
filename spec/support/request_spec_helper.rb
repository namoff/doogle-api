module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end

  def stub_get_dictionary_api_catacomb
    stub_request(:get, "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/catacomb?key=cab72891-f003-43ef-a983-253666d45082").
       with(
         headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Ruby'
         }).
       to_return(status: 200, body: "<?xml version=\"1.0\" encoding=\"utf-8\" ?>\r\n<entry_list version=\"1.0\">\n\t<entry id=\"catacomb\"><ew>catacomb</ew><hw>cat*a*comb</hw><sound><wav>cataco01.wav</wav><wpr>!ka-tu-+kOm</wpr></sound><pr>\xCB\x88ka-t\xC9\x99-\xCB\x8Ck\xC5\x8Dm</pr><fl>noun</fl><et>Middle English <it>catacumb,</it> Middle French <it>catacombe,</it> probably from Old Italian <it>catacomba,</it> from Late Latin <it>catacumbae,</it> plural</et><def><date>15th century</date> <sn>1</sn> <dt>:a subterranean cemetery of galleries with recesses for tombs <un>usually used in plural</un></dt> <sn>2</sn> <dt> :something resembling a catacomb: as</dt>  <sn>a</sn> <dt>:an underground passageway or group of passageways</dt>  <sn>b</sn> <dt>:a complex set of interrelated things <vi>the endless <it>catacomb</it><it>s</it> of formal education <aq>Kingman Brewster \xE2\x80\xA01988</aq></vi> </dt></def></entry>\r\n</entry_list>", headers: {})
  end

  def stub_get_dictionary_api_worddoesntexist
    stub_request(:get, "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/worddoesntexist?key=cab72891-f003-43ef-a983-253666d45082").
       with(
         headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Ruby'
         }).
       to_return(status: 404, body: "", headers: {})
  end

end
