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

end
