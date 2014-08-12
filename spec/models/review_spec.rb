require 'rails_helper'

RSpec.describe Review, :type => :model do

	before(:each) do
		@test_user = _create_test_user_object
		@other_user = _create_user_object('nottest@test.com', '12345678')
		_create_sample_restaurant_object(@test_user)
	end

	context 'validations' do

		it 'should have a rating' do
			invalid_review = _restaurant.reviews.create(comment: 'wonderful', user_id: @other_user.id)
			expect(invalid_review).not_to be_valid
			expect(invalid_review.errors.messages[:rating]).to include("can't be blank")
		end

		it 'should have a numerical rating' do
			invalid_review = _restaurant.reviews.create(rating: 'top', comment: 'wonderful', user_id: @other_user.id)
			expect(invalid_review).not_to be_valid
			expect(invalid_review.errors.messages[:rating]).to include("is not a number")
		end

		it 'should have a rating < 5' do
			invalid_review = _restaurant.reviews.create(rating: 99, comment: 'wonderful', user_id: @other_user.id)
			expect(invalid_review).not_to be_valid
			expect(invalid_review.errors.messages[:rating]).to include("is not included in the list")
		end

		it 'should have a rating > 0' do
			invalid_review = _restaurant.reviews.create(rating: -99, comment: 'wonderful', user_id: @other_user.id)
			expect(invalid_review).not_to be_valid
			expect(invalid_review.errors.messages[:rating]).to include("is not included in the list")
		end

		it 'the comment should be maximum 150 characters' do
			comment = "$" * 200
			invalid_review = _restaurant.reviews.create(rating: 3, comment: comment, user_id: @other_user.id)
			expect(invalid_review).not_to be_valid
			expect(invalid_review.errors.messages[:comment]).to include("is too long (maximum is 150 characters)")
		end

		it 'it should belong to a restaurant' do
			invalid_review = Review.new(rating: 3, comment: 'poor', user_id: @other_user.id)
			expect(invalid_review).not_to be_valid
		end

		it 'it should belong to a user' do
			invalid_review = _restaurant.reviews.create(rating: 3, comment: 'poor')
			expect(invalid_review).not_to be_valid
		end

		it 'should be valid with a rating in (0..5), a user and a restaurant' do
			valid_review = _restaurant.reviews.create(rating: 3, comment: 'poor', user_id: @other_user.id)
			expect(valid_review).to be_valid
		end

	end

end
