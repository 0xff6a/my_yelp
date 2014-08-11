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
			expect(page).to have_content('Red Dog Saloon')
			expect(page).to have_content('American')
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

		it 'they can be edited' do
			visit '/restaurants'
			click_link 'Edit'
			fill_in 'restaurant_cuisine', :with => 'American Diner'
			click_on 'Update Restaurant'
			expect(page).to have_content('American Diner')
			expect(page).to have_content('The restaurant has been updated')
		end

		it 'they can be deleted' do
			visit '/restaurants'
			click_link 'Delete'
			expect(page).not_to have_content('Red Dog Saloon')
			expect(page).to have_content('The restaurant has been removed')
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