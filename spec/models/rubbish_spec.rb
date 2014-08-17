require 'rails_helper'

RSpec.describe Rubbish, :type => :model do

	before(:each) do
		@test_user = _create_test_user_object
		other_user = _create_user_object('me@test.com', '12345678')
		sample_restaurant = _create_sample_restaurant_object(@test_user)
		_create_test_review_object(sample_restaurant, other_user)
	end
  
	context 'validations' do

		it 'should belong to a review' do
			invalid_rubbish = Rubbish.create(user_id: @test_user.id)
			expect(invalid_rubbish).not_to be_valid
		end

		it 'should belong to a user' do
			invalid_rubbish = _review.rubbishes.create
			expect(invalid_rubbish).not_to be_valid
		end

		it 'should be valid with a user and review' do
			valid_rubbish = _review.rubbishes.create(user_id: @test_user.id)
			expect(valid_rubbish).to be_valid
		end

		it 'should only allow a user to create it once' do
			valid_rubbish = _review.rubbishes.create(user_id: @test_user.id)
			invalid_rubbish = _review.rubbishes.create(user_id: @test_user.id)
			expect(invalid_rubbish).not_to be_valid
		end

	end

end
