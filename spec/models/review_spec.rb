require 'rails_helper'

RSpec.describe Review, :type => :model do

	before(:each) do
		_create_sample_restaurant
	end

	context 'validations' do

		it 'should have a rating' do
			invalid_review = _restaurant.reviews.create(comment: 'wonderful')
			expect(_restaurant.reviews.count).to eq(0)
			expect(invalid_review.errors.messages[:rating]).to include("can't be blank")
		end

		it 'should have a numerical rating' do
			invalid_review = _restaurant.reviews.create(rating: 'top', comment: 'wonderful')
			expect(_restaurant.reviews.count).to eq(0)
			expect(invalid_review.errors.messages[:rating]).to include("is not a number")
		end

		it 'should have a rating between 0 and 5' do
			invalid_review = _restaurant.reviews.create(rating: 99, comment: 'wonderful')
			expect(_restaurant.reviews.count).to eq(0)
			expect(invalid_review.errors.messages[:rating]).to include("is not included in the list")
		end

		it 'the comment should be maximum 150 characters' do
			comment = "$" * 200
			invalid_review = _restaurant.reviews.create(rating: 3, comment: comment)
			expect(_restaurant.reviews.count).to eq(0)
			expect(invalid_review.errors.messages[:comment]).to include("is too long (maximum is 150 characters)")
		end

		it 'it should belong to a restaurant' do
			invalid_review = Review.create(rating: 3, comment: 'poor')
			expect(_restaurant.reviews.count).to eq(0)
		end

	end

end
