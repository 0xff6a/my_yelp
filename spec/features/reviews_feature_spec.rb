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

		it 'must have a numerical rating' do
			_review_sample_restaurant("bleep", 'Wonderful')
			expect(page).to have_content("Error: rating is not a number")
		end

		it 'must have a rating between 0 and 5' do
			_review_sample_restaurant(6, 'Wonderful')
			expect(page).to have_content("Error: rating is not included in the list")
		end

	end

	context 'displaying reviews' do

		before(:each) do
			_create_sample_restaurant
		end

		it 'average score' do
			_review_sample_restaurant(5, 'Wonderful')
			_review_sample_restaurant(1, 'poor')
			expect(page).to have_content(3)
		end

	end

end