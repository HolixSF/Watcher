require 'dotenv'
require 'twilio-ruby'

class ReportsController < ApplicationController

	
  def index
    @report = Report.new 
		@tweets = Tweet.all
    @geojson = Array.new

    @tweets.each do |tweet|
      @geojson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [tweet.longitude, tweet.latitude]
        },
        properties: {
          name: tweet.name,
          handle: tweet.handle,
          content: tweet.content,
          :'marker-color' => '#ec2660',
          :'marker-symbol' => 'circle',
          :'marker-size' => 'medium'
        }
      }
    end

		@tweet_list = Array.new

		@geojson[55..60].each do |tweet|
			@tweet_list << tweet[:properties]
		end

	end

  def create 
    @report = Report.new 
    @report.send_message
    redirect_to root_path
  end 

  # def send_message 
  #   account_sid = 'ACedc6ba04e5f8fe6cb54a42fb48db154a'
  #   # 'ACedc6ba04e5f8fe6cb54a42fb48db154a'
  #   auth_token = 'f2136e8f6c44369a692f6db22cd6f6e5'

  #   # set up a client to talk to the Twilio REST API
  #   @client = Twilio::REST::Client.new account_sid, auth_token 

  #   @client.account.messages.create(
  #     from: '+17605465153',
  #     to: '+17605229866',
  #     body: 'Test, this is a test'
  #   )
  # end 

  def tweets
    @tweets = Tweet.all
    @geojson = Array.new

    @tweets.each do |tweet|
      @geojson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [tweet.longitude, tweet.latitude]
        },
        properties: {
          name: tweet.name,
          handle: tweet.handle,
          content: tweet.content,
          date_tweeted: tweet.date_tweeted,
          :'marker-color' => '#ec2660',
          :'marker-symbol' => 'circle',
          :'marker-size' => 'medium'
        }
      }
    end

    respond_to do |format|
      format.html
      format.json { render json: @geojson } #responds with the created JSON object
    end
  end

end
