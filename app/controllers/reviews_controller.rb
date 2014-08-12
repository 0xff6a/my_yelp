class ReviewsController < ApplicationController

	include ReviewsHelper

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = Review.new
	end

	def create
		review = create_review_from(params[:review], params[:restaurant_id])
		review.save ? _restaurant_review_success : _restaurant_review_error(review)
	end

	def destroy
		target_review = current_user.reviews.find(params[:id])
		target_review.delete ? _review_delete_success : _review_delete_error(target_review)
	end

end
