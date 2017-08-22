require 'faker'
# User.destroy_all
# Safari.destroy_all
# Booking.destroy_all

# safari = Safari.new(title: "Safari")
# safari.user = user_1
# safari.save

# book = Booking.new
# book.safari = safari
# book.user = user_2
# book.save

user_pic_array = [ "http://xdesktopwallpapers.com/wp-content/uploads/2012/07/Scott%20Porter%20Looking%20At%20Camera%20And%20White%20Background.jpg",
"https://profile.microsoft.com/RegsysProfileCenter/Images/personal_info.jpg",
"https://profile.microsoft.com/RegsysProfileCenter/Images/contact_pref.jpg",
"http://paccpronetwork.com/wp-content/uploads/2015/09/athlete.png",
"http://www.runnersworld.com/sites/runnersworld.com/files/styles/article_main_image_2200px/public/articles/2015/08/nicksymmondsbrookssinglet_1.jpg?itok=PDdyfNq_",
"https://media.aws.iaaf.org/media/Medium/b6b16b8e-68d3-453b-9191-196ac8550227.png?v=-2003354641",
"https://usatftw.files.wordpress.com/2014/10/ap_singapore_tennis__wta_finals_68191523.jpg?w=1000&h=600&crop=1",
"http://www.sportsmanias.com/images/gallery/27-100-hottest-instagram/display/81-Maggie-Vessey.jpg"]


20.times do
  counter = 1
  photo_url = user_pic_array.sample
  name = Faker::GameOfThrones.character
  user = User.create(name: name, email: Faker::Internet.email(name.split(" ").first), description: Faker::Lorem.paragraph,  password: "password", remote_avatar_url: photo_url)
  puts "Create user number #{counter}"
  counter += 1
end
