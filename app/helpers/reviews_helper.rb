module ReviewsHelper

	def _restaurant_review_success
		flash[:notice] = 'Thank you for your review'
		redirect_to restaurants_path
	end

	def _restaurant_review_error(review)
		flash[:errors] = review.errors.messages
		redirect_to new_restaurant_review_path(review.restaurant)
	end

end
