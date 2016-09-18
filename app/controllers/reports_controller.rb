class ReportsController < ApplicationController
	def index
	end

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
