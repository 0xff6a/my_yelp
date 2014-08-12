module RestaurantsHelper

	def create_restaurant_from(data_hash)
		current_user.restaurants.create(data_hash.permit(:name, :cuisine))
	end

	def update_restaurant_from(data_hash, restaurant_id)
		current_user.restaurants.find(restaurant_id).update(data_hash.permit(:name, :cuisine))
	end

	def _restaurant_create_success
		flash[:notice] = 'Your restaurant has been added'
		redirect_to restaurants_path
	end

	def _restaurant_create_error(bad_restaurant)
		_flash_error(bad_restaurant)
		redirect_to new_restaurant_path
	end

	def _restaurant_update_success
		flash[:notice] = 'The restaurant has been updated'
		redirect_to restaurants_path
	end

	def _restaurant_update_error(bad_restaurant)
		_flash_error(bad_restaurant)
		redirect_to edit_restaurant_path(bad_restaurant)
	end

	def _restaurant_delete_success
		flash[:notice] = 'The restaurant has been removed'
		redirect_to restaurants_path
	end

	def _restaurant_delete_error(bad_restaurant)
		_flash_error(bad_restaurant)
		redirect_to restaurants_path
	end

	def _flash_error(bad_restaurant)
		flash[:errors] = bad_restaurant.errors.messages
	end

	def _restaurant_list
		Restaurant.all.reverse
	end

end
