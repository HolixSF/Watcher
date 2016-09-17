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
          :'marker-color' => '#00607d',
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
