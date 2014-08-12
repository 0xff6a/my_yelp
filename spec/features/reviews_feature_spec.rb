describe 'Reviews feature:'  do

	before(:each) do
		_sign_up_test_user
		_create_sample_restaurant_object(_user)
	end

	context 'adding a new review' do

		it 'can be added by a user' do
			_review_sample_restaurant(5, 'Wonderful')
			expect(page).to have_content('Thank you for your review')
			expect(page).to have_content('Wonderful')
			expect(page).to have_content(5)
		end

	end

	context 'displaying reviews' do

		it 'average score' do
			_review_sample_restaurant(5, 'Wonderful')
			_review_sample_restaurant(1, 'poor')
			expect(page).to have_content(3)
		end

	end

end