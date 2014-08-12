require 'rails_helper'

RSpec.describe Restaurant, :type => :model do

	context 'validations' do

		it 'should not be created without a name' do
			invalid_restaurant = Restaurant.create(cuisine: 'none')
			expect(Restaurant.count).to eq(0)
			expect(invalid_restaurant.errors.messages[:name]).to include("can't be blank")
		end

		it 'should not be created without a cuisine' do
			invalid_restaurant = Restaurant.create(name: 'ghost')
			expect(Restaurant.count).to eq(0)
			expect(invalid_restaurant.errors.messages[:cuisine]).to include("can't be blank")
		end

	end

end
