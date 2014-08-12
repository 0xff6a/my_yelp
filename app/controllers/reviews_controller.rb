class ReviewsController < ApplicationController

	include ReviewsHelper

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = Review.new
	end

	def create
		review = Restaurant.find(params[:restaurant_id]).reviews.create(params[:review].permit(:rating, :comment))
		review.user = current_user
		review.save ? _restaurant_review_success : _restaurant_review_error(review)
	end

end
