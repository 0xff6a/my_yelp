def _restaurant
	Restaurant.first
end

def _user
	User.first
end

def _review
	Review.first
end

def _create_sample_restaurant_object(user)
	user.restaurants.create(name: 'Red Dog Saloon',
													cuisine: 'Diner')
end

def _create_user_object(email, password)
	User.create(email: email, 
							password: password,
							password_confirmation: password)
end

def _create_test_user_object
	_create_user_object('test@test.com', '12345678')
end

def _create_test_review_object(restaurant, user)
	restaurant.reviews.create(:rating => '5',
														:comment => 'Great',
														:user_id => user.id)
end