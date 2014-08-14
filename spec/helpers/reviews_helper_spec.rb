require 'rails_helper'

RSpec.describe ReviewsHelper, :type => :helper do

	context '#star_rating' do

		it 'returns N/A if argument passed is not a number' do
			expect(helper.star_rating('N/A')).to eq('N/A')
		end

		it 'returns ★★★★★ for a rating of 5' do
			expect(helper.star_rating(5)).to eq('★★★★★')
		end

		it 'returns ★★★☆☆ for a rating of 3' do
			expect(helper.star_rating(3)).to eq('★★★☆☆')
		end

		it 'returns ★★★★☆ for a rating of 4.3' do
			expect(helper.star_rating(4.3)).to eq('★★★★☆')
		end

	end

end