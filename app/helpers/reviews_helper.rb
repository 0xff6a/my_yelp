module ReviewsHelper

	def create_review_from(data_hash, restaurant_id)
		review = Restaurant.find(restaurant_id).reviews.create(data_hash.permit(:rating, :comment))
		review.user = current_user
		return review
	end

	def _restaurant_review_success
		flash[:notice] = 'Thank you for your review'
		redirect_to restaurants_path
	end

	def _restaurant_review_error(review)
		flash[:errors] = review.errors.messages
		redirect_to restaurants_path
	end

	def _review_delete_success
		flash[:notice] = 'Your review has been deleted'
		redirect_to restaurants_path
	end

	def _review_delete_error(review)
		flash[:errors] = review.errors.messages
		redirect_to restaurants_path	
	end

end
