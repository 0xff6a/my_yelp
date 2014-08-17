require 'rails_helper'

RSpec.describe Rate, :type => :model do
	
	before(:each) do
		@test_user = _create_test_user_object
		other_user = _create_user_object('me@test.com', '12345678')
		sample_restaurant = _create_sample_restaurant_object(@test_user)
		_create_test_review_object(sample_restaurant, other_user)
	end
  
	context 'validations' do

		it 'should belong to a review' do
			invalid_rate = Rate.create(user_id: @test_user.id)
			expect(invalid_rate).not_to be_valid
		end

		it 'should belong to a user' do
			invalid_rate = _review.rates.create
			expect(invalid_rate).not_to be_valid
		end

		it 'should be valid with a user and review' do
			valid_rate = _review.rates.create(user_id: @test_user.id)
			expect(valid_rate).to be_valid
		end

	end
	
end
