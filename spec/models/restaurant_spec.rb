require 'rails_helper'

RSpec.describe Restaurant, :type => :model do

	before(:each) { _create_test_user_object }

	context 'validations' do

		it 'should not be created without a name' do
			invalid_restaurant = _user.restaurants.create(cuisine: 'none')
			expect(invalid_restaurant).not_to be_valid
			expect(invalid_restaurant.errors.messages[:name]).to include("can't be blank")
		end

		it 'should not be created without a cuisine' do
			invalid_restaurant = _user.restaurants.create(name: 'ghost')
			expect(invalid_restaurant).not_to be_valid
			expect(invalid_restaurant.errors.messages[:cuisine]).to include("can't be blank")
		end

		it 'should belong to a user' do
			invalid_restaurant = Restaurant.create(name: 'ghost', cuisine: 'none')
			expect(invalid_restaurant).not_to be_valid
		end

		it 'should be valid with a name, a cuisine and a user' do
			valid_restaurant = _user.restaurants.create(name: 'Good', cuisine: 'French')
			expect(valid_restaurant).to be_valid
		end

	end

	context '#average_rating' do

		before(:each) { _user.restaurants.create(name: 'Good', cuisine: 'French') }

		it 'returns N/A when there are no reviews' do
			expect(_restaurant.average_rating).to eq('N/A')
		end

		it 'returns the rating when there is only one rating' do
			_restaurant.reviews.create(rating: 3, user_id: 1)
			expect(_restaurant.average_rating).to eq(3)
		end

		it 'returns the average of ratings for a restaurant' do
			_restaurant.reviews.create(rating: 3, user_id: 1)
			_restaurant.reviews.create(rating: 5, user_id: 2)
			expect(_restaurant.average_rating).to eq(4)
		end

	end

	context '#reviewable_by' do

		before(:each) do
			_user.restaurants.create(name: 'Good', cuisine: 'French') 
			@other_user = _create_user_object('nottest@test.com', '12345678')
		end

		it 'knows whether a restaurant can be reviewed by a given user' do
			expect(_restaurant.is_reviewable_by?(_user)).to be false
			expect(_restaurant.is_reviewable_by?(@other_user)).to be true
		end

	end

end
