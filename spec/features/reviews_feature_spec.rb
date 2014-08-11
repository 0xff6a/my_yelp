describe 'reviews'  do

	context 'adding a new review' do

		before(:each) do
			_create_sample_restaurant
		end

		it 'can be added by a user' do
			_review_sample_restaurant(5, 'Wonderful')
			expect(page).to have_content('Thank you for your review')
			expect(page).to have_content('Wonderful')
			expect(page).to have_content(5)
		end

	end

	context 'displaying reviews' do

		before(:each) do
			_create_sample_restaurant
		end

		it 'average score' do
			_review_sample_restaurant(5, 'Wonderful')
			_review_sample_restaurant(1, 'Wonderful')
			expect(page).to have_content(3)
		end

	end

	def _create_sample_restaurant
		Restaurant.create(name: 'Red Dog Saloon',
												cuisine: 'Diner',				)
	end

	def _review_sample_restaurant(rating, comment)
		visit '/restaurants'
		click_link 'Review'
		fill_in 'review_rating', with: rating
		fill_in 'review_comment', with: comment
		click_on 'Publish'
	end

end