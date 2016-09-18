require 'faker'
# require_relative './hatetweets.txt'
# require_relative './suicidetweets.txt'

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
users = 20.times.map do
  User.create!( :fullname => Faker::Name.first_name,
                :email      => Faker::Internet.email,
                :password   => 'abcd', 
                :handle => "@" + Faker::Name.first_name
                )
end


# f = File.open("suicidetweets.txt", "r")
# array = f.read

arrayhate = [
  "I'm going to kill her",
  "I'm going to kill him",
  "ok you white girls are starting to look alike like a mutherfucka.I swear i went to high school with them two girls!",
  "Fuck niggas",
  "I hate that bitch. I want to hurt her",
  "Apple has a new device for Chinese people. It's called the eye opener",
  "I hate all white people. White cops are the devil",
  "Fuck the japs",
  "If we had a real life purge I would kill as many Mexicans as I could in one night",
  "I'm actually okay with the recent police shootings",
  "The Crips are going to get it tonight. Let's take them out one by one",
  "I was 19-years-old when my heart first got broken..I’m over it now but I wonder what that fat ugly bitch is up to…",
  "Question for my gay followers ... Are Skittles y’all’s favorite candy?",
  "Question for my gay followers …. Are Skittles y’all’s favorite candy?",
  "Wish that dickhead in the next room would either shut up or learn some English so I would at least know what he’s planning to bomb!",
  "Hitler had the right idea with the Jews",
  "I fucking love my race and I don't wish to be like anyone else",
  "That runningback runs like a monkey",
  "My waiter looked so much like I terrorist...I felt like he was going to plant a bomb into my meal",
  "Drunk natives brushing his pony tail on me",
  "fUcK yOu In ThE aSs PuNk wHiTe BoY",
  "Dreds on a white boy just makes you look homeless",
  "I'm not hateful toward black people, I just think the cops need to continue to be harsh toward them",
  "White people have are so boring",
  "I don't like people white people because they're too fucking dramatic",
  "Stand the fuck up you fucking coon nigger!!!!",
  "She's going to get it.",
  "We need more Mexicans to mow the lawns around here. This neighborhood is getting pretty grassy",
  "White cops should be banned"
]

arrayhate.each do |line|
  Tweet.create!(
    :name => Faker::Name.first_name,
    :handle => "@" + Faker::Name.first_name,
    content: line,
    longitude: rand(-122.409228...-122.385195),
    latitude: rand(37.780988...37.788297)
     )
end 

# f.close

# g = File.open("hatetweets.txt", "r")
# array = g.read

arraysuicide = [ 
  "I'm so sorry to everyone I've ever hurt", 
  "I feel hurt", 
  "I feel lonely", 
  "I'm selling most of my belongings if anyone wants anything", 
  "I'm going to kill myself", 
  "Hey guys, I'm really struggling", 
  "Is there anyone out there? Can anyone help me?", 
  "I'm feeling really down.", 
  "Hey guys, I'm giving away all my things. Please contact me if you want anything.", 
  "I'm so sorry to everyone I've ever hurt!", 
  "Goodbye, everybody!",
  "I must end it. There's no hope left. I'll be at peace. No one had anything to do with this",
  "The future is just old age and illness and pain.... I must have peace and this is the only way.",
  "To my friends: My work is done. Why wait?",
  "I am now about to make the great adventure. I cannot endure this agonizing pain any longer.",
  "And so I leave this world, where the heart must either break or turn to lead.",
  "They tried to get me - I got them first!",
  "There's no hope left. I'll be at peace. No one had anything to do with this. My decision totally.",
  "The future is just old age and illness and pain... I must have peace and this is the only way.",
  "I can't go on spoiling you life any longer.",
  "I am constantly torn between killing myself and killing everyone around me.",
  "I can't carry on anymore, I must end this.",
  "Goodbye everyone. I leaving this world embarking for a new one.",
  "I hate everyone and I don't want to live anymore",
  "The end for me is here.",
  "I don't want to be saved, I just want to leave this world",
  "Nobody wants me around, so I'll leave now.",
  "I can't be here anymore. Goodbye to this world and to everyone I know.",
  "I don't want anyone to find me or come save me. I'm about to do it.",
  "I'm selling everything and leaving everyone because the end is here. Goodbye.",
  "You all will be sorry when I'm gone."
]

arraysuicide.each do |line|
  Tweet.create(
    :name => Faker::Name.first_name,
    :handle => "@" + Faker::Name.first_name,
    content: line,
    longitude: rand(-122.409228...-122.385195),
    latitude: rand(37.780988...37.788297)
     )
end 

# f.close
