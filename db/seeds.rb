Booking.destroy_all
Safari.destroy_all
User.destroy_all

user_1 = User.create(name: "hello", email: "hello@lewagon.com", password: "123456")

user_2 = User.create(name: "hi", email: "hi@lewagon.com", password: "123456")

safari = Safari.new(title: "Safari")
safari.user = user_1
safari.save

book = Booking.new
book.safari = safari
book.user = user_2
book.save
