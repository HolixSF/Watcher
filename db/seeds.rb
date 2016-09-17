20.times do
  Tweet.create(
    name: "John Doe",
    handle: "@JohnDoe",
    content: "TweetTweetTweetTweetTweet",
    longitude: rand(-122.409228...-122.385195),
    latitude: rand(37.780988...37.788297)
     )
end
