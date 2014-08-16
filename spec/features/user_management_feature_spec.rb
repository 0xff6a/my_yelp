require 'rails_helper'

describe 'User management feature:' do

	context 'signing up' do

		it 'a user can sign up to the site ' do
			_sign_up_test_user
			expect(page).to have_content('Welcome! You have signed up successfully')
			expect(page).to have_content('test@test.com')
		end

	end

	context 'signing in' do

		before(:each) do
			_sign_up_test_user 
			_sign_out
		end

		it 'a user can sign in to the site once signed up ' do
			_sign_in
			expect(page).to have_content('Signed in successfully')
			expect(page).to have_content('test@test.com')
		end

	end

	context 'signing out' do

		before(:each) { _sign_up_test_user }
			
		it 'a user can sign out once signed in' do
			_sign_out
			expect(page).to have_content('Signed out successfully')
			expect(page).not_to have_content('test@test.com')
		end

	end

	context	'access rights when signed out' do

		it 'a user cannot see a link to add restaurants' do
			visit restaurants_path
			expect(page).not_to have_css 'a', text: 'Add a restaurant'
		end

	end

	context 'access rights when signed in' do

		before(:each) { _sign_up_test_user }

		it 'a user can only see a link to edit restaurants they have created' do
			_create_restaurant_and_logout
			expect(page).not_to have_css 'a', text: 'Edit'
		end

		it 'a user can only delete restaurants they have created' do
			_create_restaurant_and_logout
			expect(page).not_to have_css 'a', text: 'Delete'
		end

		it 'a user can only leave 1 review per restaurant' do
			_create_restaurant_and_logout
			_review_sample_restaurant(5, 'Good')
			_review_sample_restaurant(5, 'Amazing')
			expect(page).to have_content('you cannot post multiple reviews')
			expect(page).not_to have_content('Amazing')
		end

		it 'a user can delete their own reviews' do
			_create_restaurant_and_logout
			_review_sample_restaurant(1, 'very bad')
			within('ul.restaurant-reviews-list') { click_link 'Delete' }
			expect(page).not_to have_content('very bad')
			expect(page).to have_content('Your review has been deleted')
		end

		it 'a user cannot delete another users review' do
			_create_review_and_logout
			_sign_in
			within('ul.restaurant-reviews-list') do
				expect(page).not_to have_css 'a', 'Delete'
			end
		end

		it 'users cannot review restaurants they have created' do
			_add_restaurant('KFC', 'bad')
			within('ul.restaurant-reviews-list') do
				expect(page).not_to have_content('Review')
			end
		end

	end

end