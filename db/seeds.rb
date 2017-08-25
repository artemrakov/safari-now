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
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email(:first_name), description: Faker::Lorem.paragraphs(6).join("\n"),  password: "password", remote_avatar_url: photo_url)
  puts "Created user number #{counter}"
  counter += 1
end

# Seeding Safaris

address_array = ["Four Seasons Rd, 2002, Tanzania", "North Serengeti National Park, Seronera, Tanzania", "Taita Hills Wildlife Sanctuary, Tsavo National Park West, Kenya",
  "Tsavo National Park West 34117, Kenya", "Nairobi 80100, Kenya", "Arusha, Tanzania", "2 Serengeti Road, Arusha, Tanzania", "Cape Town Central 7806, South Africa",
  "Kruger National Park 1709, South Africa", "54 Mann Street, George 6529, South Africa", "184 Elsa Street | Strijdompark, Johannesburg 2198, South Africa", "Mombasa 80100, Kenya"]

safari_titles = ['A Taste of the Wild', 'Big Five Flying Safari', 'Born Free Safari', 'From Antelope to Zebra', 'Governors of the Savanna', 'Masai Explorer', 'Masai Mara Safari', 'Discovery Extreme', 'Ultimate Adventure']

counter = 1
10.times do
  offset = rand(Model.count)
  safari_address = address_array.sample
  photo_url =
  safari = Safari.new(
    title: safari_titles.sample,
    address: safari_address, description: Faker::Lorem.paragraphs(10).join("\n"),
    capacity: (1..10).to_a.sample, price: (100..1000).to_a.sample, date: Faker::Date.forward(23))
  safari.user = user.offset(offset).first
  safari.save
  puts "Created safari number #{counter}"
  counter += 1
end

# Seeding Safari images
counter = 1
10.times do
  @image = SafariImage.create(remote_photo_url: "https://source.unsplash.com/collection/141713/1600x900", safari_id: (1..10).to_a.sample)
  puts "Whew! Just created a Safari Image and set it to Safari number #{@image.safari_id}"
  counter += 1
end

