class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :name
      t.string :handle
      t.text :content
      t.float :longitude
      t.float :latitude
      t.string :date_tweeted
      t.float :anger
      t.float :disgust
      t.float :fear
      t.float :joy
      t.float :sadness
      t.float :analytical
      t.float :confident
      t.float :tentative
      t.float :openness
      t.float :conscientiousness
      t.float :extraversion
      t.float :agreeableness
      t.float :emotional_range
    end
  end
end
