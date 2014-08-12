require 'rails_helper'

describe 'User management feature:' do

	context 'signing up' do

		it 'a user can sign up to the site' do
			visit restaurants_path
			click_link 'Sign Up'
			within('#new_user') do
				fill_in 'user_email', with: 'test@test.com'
				fill_in 'user_password', with: '12345678'
				fill_in 'user_password_confirmation', with: '12345678'
				click_on 'Sign up'
			end
			expect(page).to have_content('Welcome! You have signed up successfully')
			expect(page).to have_content('test@test.com')
		end

	end

end