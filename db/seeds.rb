require 'faker'

20.times do
  Tweet.create(
    name: "John Doe",
    handle: "@JohnDoe",
    content: "TweetTweetTweetTweetTweet",
    longitude: rand(-122.409228...-122.385195),
    latitude: rand(37.780988...37.788297)
     )
end

# Pending parameters for the user table 
users = 100.times.map do
  User.create!( :first_name => Faker::Name.first_name,
                :last_name  => Faker::Name.last_name,
                :email      => Faker::Internet.email,
                :password   => 'password', 
                :twitter )
end


f = File.open("suicidetweets.txt", "r")
f.each_line { |line|
  Tweet.create(
    :name => Faker::Name.first_name,
    :handle => "@" + Faker::Name.first_name,
    content: "#{line}",
    longitude: rand(-122.409228...-122.385195),
    latitude: rand(37.780988...37.788297)
     )
}
f.close

f = File.open("hatetweets.txt", "r")
f.each_line { |line|
  Tweet.create(
    :name => Faker::Name.first_name,
    :handle => "@" + Faker::Name.first_name,
    content: "#{line}",
    longitude: rand(-122.409228...-122.385195),
    latitude: rand(37.780988...37.788297)
     )
}
f.close
