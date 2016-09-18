module ReportsHelper
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

# class Alert 
  
#   def send_message 
#     account_sid = 'ACedc6ba04e5f8fe6cb54a42fb48db154a'
#     # 'ACedc6ba04e5f8fe6cb54a42fb48db154a'
#     auth_token = 'f2136e8f6c44369a692f6db22cd6f6e5'

#     # set up a client to talk to the Twilio REST API
#     @client = Twilio::REST::Client.new account_sid, auth_token 

#     @client.account.messages.create(
#       from: '+17605465153',
#       to: '+17605229866',
#       body: 'Test, this is a test'
#     )
#   end 

# end 

end
