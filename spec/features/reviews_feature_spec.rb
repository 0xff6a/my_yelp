describe 'reviews'  do

	context 'adding a new review' do

		before(:each) do
			_create_sample_restaurant
		end

		it 'can be added by a user' do
			visit '/restaurants'
			click_link 'Review'
			fill_in 'review_rating', :with => 5
			fill_in 'review_comment', :with => 'Wonderful'
			click_on 'Publish'
			expect(page).to have_content('Thank you for your review')
			expect(page).to have_content('Wonderful')
			expect(page).to have_content(5)
		end

	end

	def _create_sample_restaurant
		Restaurant.create(name: 'Red Dog Saloon',
												cuisine: 'Diner',				)
	end

end