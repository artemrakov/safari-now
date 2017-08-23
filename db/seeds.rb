require 'faker'
Booking.destroy_all
puts "Destroying Bookings"
puts "Destroyed all bookings"
Safari.destroy_all
puts "Destroying Safaris"
puts "Destroyed them"
User.destroy_all
puts "Destroyed users"
puts "Destroying them too"

# Seeding Users
user_pic_array = [ "http://xdesktopwallpapers.com/wp-content/uploads/2012/07/Scott%20Porter%20Looking%20At%20Camera%20And%20White%20Background.jpg",
"https://profile.microsoft.com/RegsysProfileCenter/Images/personal_info.jpg",
"https://profile.microsoft.com/RegsysProfileCenter/Images/contact_pref.jpg",
"http://paccpronetwork.com/wp-content/uploads/2015/09/athlete.png",
"http://www.runnersworld.com/sites/runnersworld.com/files/styles/article_main_image_2200px/public/articles/2015/08/nicksymmondsbrookssinglet_1.jpg?itok=PDdyfNq_",
"https://media.aws.iaaf.org/media/Medium/b6b16b8e-68d3-453b-9191-196ac8550227.png?v=-2003354641",
"https://usatftw.files.wordpress.com/2014/10/ap_singapore_tennis__wta_finals_68191523.jpg?w=1000&h=600&crop=1",
"http://www.sportsmanias.com/images/gallery/27-100-hottest-instagram/display/81-Maggie-Vessey.jpg"]

counter = 1
10.times do
  photo_url = user_pic_array.sample
  full_name = Faker::GameOfThrones.character.split(' ')
  user = User.create(first_name: full_name[0], last_name: full_name[1], email: Faker::Internet.email, description: Faker::Lorem.paragraph,  password: "password", remote_avatar_url: photo_url)
  puts "Created user number #{counter}"
  counter += 1
end

# Seeding Safaris
counter = 1
10.times do
  photo_url = "https://source.unsplash.com/collection/141713/1600x900"
  safari = Safari.new(
    title: Faker::University.name,
    location: Faker::Address.country, description: Faker::Lorem.sentence(24),
    capacity: (1..10).to_a.sample, price: (100..1000).to_a.sample, date: Faker::Date.forward(23))
  safari.user = User.first
  safari.save
  puts "Created safari number #{counter}"
  counter += 1
end

# Seeding Booking
book = Booking.new
book.safari = Safari.first
book.user = User.first
book.save
