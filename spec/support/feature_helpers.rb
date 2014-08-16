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

def _sign_out
	click_link 'Sign Out'
end

def _sign_in
	click_link 'Sign In'
	fill_in 'user_email', with: 'test@test.com'
	fill_in 'user_password', with: '12345678'
	click_on 'Sign in'
end

def _create_review_and_logout
	_create_restaurant_and_logout
	_review_sample_restaurant(1, 'very bad')
	_sign_out
end

def _create_restaurant_and_logout
	_add_restaurant('KFC', 'bad')
	_sign_out
	_sign_up_user('nottest@test.com', '12345678')
end