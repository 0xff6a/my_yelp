def _create_sample_restaurant
	Restaurant.create(name: 'Red Dog Saloon',
											cuisine: 'Diner',				)
end

def _review_sample_restaurant(rating, comment)
	visit restaurants_path
	click_link 'Review'
	select(rating, :from => 'review_rating')
	fill_in 'review_comment', with: comment
	click_on 'Publish'
end

def _edit_restaurant(name, cuisine)
		visit restaurants_path
		click_link 'Edit'			
		fill_in 'restaurant_name', with: name if name
		fill_in 'restaurant_cuisine', with: cuisine if cuisine
		click_on 'Update Restaurant'
end

def _add_restaurant(name, cuisine)
	visit restaurants_path
	click_link 'Add a restaurant'
	fill_in 'restaurant_name', with: name
	fill_in 'restaurant_cuisine', with: cuisine
	click_on 'Add Restaurant'
end

def _delete_restaurant
	visit restaurants_path
	click_link 'Delete'
end

def _restaurant
	Restaurant.first
end

def _sign_up_test_user
	_sign_up_user('test@test.com', '12345678')
end

def _sign_up_user(email, password)
	visit restaurants_path
	click_link 'Sign Up'
	within('#new_user') do
		fill_in 'user_email', with: email
		fill_in 'user_password', with: password
		fill_in 'user_password_confirmation', with: password
		click_on 'Sign up'
	end
end