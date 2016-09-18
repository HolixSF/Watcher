class ReportsController < ApplicationController
	def index
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
