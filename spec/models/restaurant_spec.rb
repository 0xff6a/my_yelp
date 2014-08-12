require 'rails_helper'

RSpec.describe Restaurant, :type => :model do

	context 'validations' do

		before(:each) { _create_test_user_object }

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

end
