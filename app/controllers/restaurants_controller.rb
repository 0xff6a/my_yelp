class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all.reverse
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		new_restaurant = _create_restaurant_from(params[:restaurant])
		new_restaurant.save ? _restaurant_create_success : _restaurant_create_error(new_restaurant)
	end

	def edit
		@restaurant = current_user.restaurants.find(params[:id])
	end

	def update
		target_restaurant = _update_restaurant_from(params[:restaurant], params[:id])
		target_restaurant ? _restaurant_update_success : _restaurant_update_error
	end

	def destroy
		target_restaurant = current_user.restaurants.find(params[:id])
		target_restaurant.delete ? _restaurant_delete_success : _restaurant_delete_error(target_restaurant)
	end

	private

	def _create_restaurant_from(data_hash)
		current_user.restaurants.create(data_hash.permit(:name, :cuisine))
	end

	def _update_restaurant_from(data_hash, restaurant_id)
		current_user.restaurants.find(restaurant_id).update(data_hash.permit(:name, :cuisine))
	end

	def _restaurant_create_success
		flash[:notice] = 'Your restaurant has been added'
		redirect_to restaurants_path
	end

	def _restaurant_create_error(bad_restaurant)
		_flash_error(bad_restaurant)
		redirect_to restaurants_path
	end

	def _restaurant_update_success
		flash[:notice] = 'The restaurant has been updated'
		redirect_to restaurants_path
	end

	def _restaurant_update_error
		flash[:errors] = [['your update failed']]
		redirect_to restaurants_path
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

end
