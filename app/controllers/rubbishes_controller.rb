class RubbishesController < ApplicationController

	def create
    review = Review.find(params[:review_id])
    review.rubbishes.create(user_id: current_user.id)

    render json: { new_rubbishes_count:  review.rubbishes.count }
	end

end
