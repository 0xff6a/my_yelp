require 'rails_helper'

describe 'restaurants' do
	
	context 'no restaurants have been added' do

		it 'should display a prompt to add a restaurant ' do
			visit restaurants_path
			expect(page).to have_content('No restaurants listed')
			expect(page).to have_link('Add a restaurant')
		end

		it 'should allow a user to add a restaurant' do
			_add_restaurant('Red Dog Saloon', 'American')
			expect(page).to have_content('Red Dog Saloon')
			expect(page).to have_content('American')
			expect(page).to have_content('Your restaurant has been added')
		end	

		it 'should throw an error if a no-name restaurant is added' do
			_add_restaurant('', 'American')
			expect(page).to have_content("Error: name can't be blank")
		end

		it 'should throw an error if a no-cuisine restaurant is added' do
			_add_restaurant('KFC', '')
			expect(page).to have_content("Error: cuisine can't be blank")
		end

	end

	context 'restaurants have been added' do

		before(:each) do
			_create_sample_restaurant
		end

		it 'should display them' do
			visit restaurants_path
			expect(page).to have_content('Red Dog Saloon')
			expect(page).to have_content('Diner')
		end

		it 'they can be edited' do
			_edit_restaurant(nil, 'American Diner')
			expect(page).to have_content('American Diner')
			expect(page).to have_content('The restaurant has been updated')
		end

		it 'they can be deleted' do
			_delete_restaurant
			expect(page).not_to have_content('Red Dog Saloon')
			expect(page).to have_content('The restaurant has been removed')
		end

	end

end