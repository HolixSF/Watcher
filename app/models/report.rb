require 'dotenv'
require 'twilio-ruby'


class Report < ApplicationRecord

  def send_message 
    account_sid = 'ACedc6ba04e5f8fe6cb54a42fb48db154a'
    # 'ACedc6ba04e5f8fe6cb54a42fb48db154a'
    auth_token = 'f2136e8f6c44369a692f6db22cd6f6e5'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token 

    @client.account.messages.create(
      from: '+17605465153',
      to: '+17605229866',
      body: 'This is an alert by The Watch. People who care about you 
              will follow up with you shortly. In the mean time, please stay where you are 
              and refrain from harming yourself.'
    )
    
  end 


end
