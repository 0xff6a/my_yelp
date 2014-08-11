require 'rails_helper'

describe 'restaurants' do
	
	context 'no restaurants have been added' do

		it 'should display a prompt to add a restaurant ' do
			visit '/restaurants'
			expect(page).to have_content('No restaurants listed')
			expect(page).to have_link('Add a restaurant')
		end

		it 'should allow a user to add a restaurant' do
			visit '/restaurants'
			click_link 'Add a restaurant'
			fill_in 'restaurant_name', :with => 'Red Dog Saloon'
			fill_in 'restaurant_cuisine', :with => 'American'
			click_on 'Add Restaurant'
			expect(Restaurant.count).to eq(1)
			expect(Restaurant.first.name).to eq('Red Dog Saloon')
			expect(Restaurant.first.cuisine).to eq('American')
		end	

	end

	context 'restaurants have been added' do

		before(:each) do
			Restaurant.create(name: 'Red Dog Saloon')
		end

		it 'should display them' do
			visit '/restaurants'
			expect(page).to have_content('Red Dog Saloon')
		end

	end

end