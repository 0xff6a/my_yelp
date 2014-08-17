class RatesController < ApplicationController

	def create
    @review = Review.find(params[:review_id])
    @review.rates.create(user_id: current_user.id)

    render json: { new_rates_count:  @review.rates.count }
	end

end
