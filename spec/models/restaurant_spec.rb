require 'rails_helper'
require 'devise'

RSpec.describe Restaurant, :type => :model do

	context 'validations' do

		before(:each) { _create_test_user_object }

		it 'should not be created without a name' do
			invalid_restaurant = _user.restaurants.create(cuisine: 'none')
			expect(Restaurant.count).to eq(0)
			expect(invalid_restaurant.errors.messages[:name]).to include("can't be blank")
		end

		it 'should not be created without a cuisine' do
			invalid_restaurant = _user.restaurants.create(name: 'ghost')
			expect(Restaurant.count).to eq(0)
			expect(invalid_restaurant.errors.messages[:cuisine]).to include("can't be blank")
		end

		it 'should belong to a user' do
			Restaurant.create(name: 'ghost', cuisine: 'none')
			expect(Restaurant.count).to eq(0)
			_user.restaurants.create(name: 'ghost', cuisine: 'none')
			expect(Restaurant.count).to eq(1)
		end

	end

end
