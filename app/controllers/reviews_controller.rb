class ReviewsController < ApplicationController

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = Review.new
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@restaurant.reviews.create(params[:review].permit(:rating, :comment))
		_restaurant_review_success
	end

	def _restaurant_review_success
		flash[:notice] = 'Thank you for your review'
		redirect_to '/restaurants'
	end

end
