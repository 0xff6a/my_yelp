require 'rails_helper'

describe 'Endorsing reviews: ' do

	before(:each) do
		_sign_up_test_user
		_create_restaurant_and_logout
		_review_sample_restaurant(1, 'very bad')
	end

	context 'rate' do
		
		it 'a signed in user can rate a review, updating the reviews rate count', :js => true do
			visit restaurants_path
			click_link 'Rate'
			expect(page).to have_css 'var', text: '1'
		end

	end

	context 'rubbish' do
	end

end