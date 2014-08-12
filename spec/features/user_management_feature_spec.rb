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

	context 'content access rights' do

		before(:each) { _sign_up_test_user }

		it 'a user can only edit restaurants they have created' do
			
		end

		xit 'a user can only delete restaurants they have created' do
		end

		xit 'a user can only leave 1 review per restaurant' do
		end

		xit 'a user can delete their own reviews only' do
		end

		xit 'users cannot review restaurants they have created' do
		end

	end

end