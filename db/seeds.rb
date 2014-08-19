# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Restaurant.destroy_all

user1 = User.create(email: '1@1.com', password:'12345678', password_confirmation: '12345678')	
user2 = User.create(email: '2@2.com', password:'12345678', password_confirmation: '12345678')		
user3 = User.create(email: '3@3.com', password:'12345678', password_confirmation: '12345678')	

restaurant1 = user1.restaurants.create(name: 'Red Dog Saloon', cuisine: 'Diner')
restaurant2 = user2.restaurants.create(name: 'Duck and Waffle', cuisine: 'British')
restaurant3 = user3.restaurants.create(name: 'NanBan', cuisine: 'Japanese')

review1 = restaurant1.reviews.create(:rating => '4', :comment => 'Great', :user_id => user2.id)
review2 =restaurant1.reviews.create(:rating => '3', :comment => 'Good food, but disappointing service', :user_id => user3.id)

review3 =restaurant2.reviews.create(:rating => '1', :comment => 'Poor', :user_id => user1.id)
review4 =restaurant2.reviews.create(:rating => '2', :comment => 'Interesting menu, bad execution', :user_id => user3.id)

review5 =restaurant3.reviews.create(:rating => '5', :comment => 'Great!', :user_id => user1.id)
review6 =restaurant3.reviews.create(:rating => '5', :comment => 'Unbelievable!', :user_id => user2.id)

review1.rubbishes.create(user_id: user1.id)
review1.rubbishes.create(user_id: user2.id)
review2.rates.create(user_id: user3.id)

review3.rubbishes.create(user_id: user1.id)
review3.rates.create(user_id: user3.id)
review3.rates.create(user_id: user2.id)