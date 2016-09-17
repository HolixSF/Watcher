require 'httparty'

class Watsonhelper
  include HTTParty

  base_uri 'https://gateway.watsonplatform.net/tone-analyzer/api'

  def wat(message)
    auth = {:username => "2a306dfa-0227-490d-974d-0a88bc7f8ee1", :password => "pdRN6mpUSiSw"}
    query = {text: "#{message}", version: '2016-05-19', tones: 'emotion', sentences: 'false'}
    response = self.class.get('/v3/tone', { basic_auth: auth, query: query })
    JSON.parse(response.body)
  end

end 

#driver 

helper = Watsonhelper.new

p helper.wat("I want to kill myself")
