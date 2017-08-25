require 'faker'
require 'nokogiri'
require 'open-uri'

def get_descriptions
  url = "https://www.bookallsafaris.com"
  html = open(url).read
  noko = Nokogiri::HTML(html)
  links = noko.css('.caption-section').css('a')

  shows = links.map do |noko_link|
    url + noko_link.attributes["href"].value
  end

  descriptions = shows.map do |lol|
    parse = Nokogiri::HTML(open(lol))
    paras =  parse.css('p')
    long_paras =  paras.select do |para|
      para.text.length > 300
    end
    long_paras.first.text
  end

  return descriptions
end

Booking.destroy_all
puts "Destroying Bookings"
Safari.destroy_all
puts "Destroying Safaris"
User.destroy_all
puts "Destroying users"

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
puts "Hold up, I'm scraping descriptions from a website"
descriptions = get_descriptions
puts "OK done scraping"
address_array = ["Four Seasons Rd, 2002, Tanzania", "North Serengeti National Park, Seronera, Tanzania", "Taita Hills Wildlife Sanctuary, Tsavo National Park West, Kenya",
  "Tsavo National Park West 34117, Kenya", "Nairobi 80100, Kenya", "Arusha, Tanzania", "2 Serengeti Road, Arusha, Tanzania", "Cape Town Central 7806, South Africa",
  "Kruger National Park 1709, South Africa", "54 Mann Street, George 6529, South Africa", "184 Elsa Street | Strijdompark, Johannesburg 2198, South Africa", "Mombasa 80100, Kenya"]

safari_titles = ['A Taste of the Wild', 'Big Five Flying Safari', 'Born Free Safari', 'From Antelope to Zebra', 'Governors of the Savanna', 'Masai Explorer', 'Masai Mara Safari', 'Discovery Extreme', 'Ultimate Adventure']

counter = 1
10.times do
  offset = rand(User.count)
  safari_address = address_array.sample
  safari = Safari.new(
    title: safari_titles.sample,
    address: safari_address, description: descriptions.sample,
    capacity: (1..10).to_a.sample, price: (100..1000).to_a.sample, date: Faker::Date.forward(23),

    )
  safari.user = User.offset(offset).first
  safari.save
  puts "Created safari number #{counter}"
  counter += 1
end

# Seeding Safari images
counter = 1
10.times do
2.times do
  @image = SafariImage.create(remote_photo_url: "https://source.unsplash.com/collection/141713/1600x900", safari_id: counter)
  puts "Whew! Just created a Safari Image and set it to Safari number #{@image.safari_id}"
end
  counter += 1
end
