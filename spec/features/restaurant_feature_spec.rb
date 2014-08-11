require 'rails_helper'

describe 'restaurants' do
	
	context 'no restaurants have been added' do

		it 'should display a prompt to add a restaurant ' do
			visit '/restaurants'
			expect(page).to have_content('No restaurants listed')
			expect(page).to have_link('Add a restaurant')
		end

		it 'should allow a user to add a restaurant' do
			_add_restaurant('Red Dog Saloon', 'American')
			expect(Restaurant.count).to eq(1)
			expect(_restaurant.name).to eq('Red Dog Saloon')
			expect(_restaurant.cuisine).to eq('American')
			expect(page).to have_content('Your restaurant has been added')
		end	

	end

	context 'restaurants have been added' do

		before(:each) do
			Restaurant.create(name: 'Red Dog Saloon',
												cuisine: 'Diner'				)
		end

		it 'should display them' do
			visit '/restaurants'
			expect(page).to have_content('Red Dog Saloon')
			expect(page).to have_content('Diner')
		end

	end

	def _add_restaurant(name, cuisine)
		visit '/restaurants'
		click_link 'Add a restaurant'
		fill_in 'restaurant_name', :with => name
		fill_in 'restaurant_cuisine', :with => cuisine
		click_on 'Add Restaurant'
	end

	def _restaurant
		Restaurant.first
	end

end