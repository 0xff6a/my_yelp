require 'rails_helper'

describe 'restaurants' do
	
	context 'no restaurants have been added' do

		it 'should display a prompt to add a restaurant ' do
			visit '/restaurants'
			expect(page).to have_content('No restaurants listed')
			expect(page).to have_link('Add a restaurant')
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