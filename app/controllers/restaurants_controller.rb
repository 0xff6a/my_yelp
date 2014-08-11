class RestaurantsController < ApplicationController

	def index
		@restaurants = _restaurant_list
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		new_restaurant = Restaurant.create(params[:restaurant].permit(:name, :cuisine))
		new_restaurant ? _restaurant_create_success : _restaurant_create_error(new_restaurant.errors)
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		target_restaurant = Restaurant.find(params[:id])
		target_restaurant.update(params[:restaurant].permit(:name, :cuisine))
		_restaurant_update_success
	end

	def destroy
		target_restaurant = Restaurant.find(params[:id])
		target_restaurant.delete
		_restaurant_delete_success
	end

	def _restaurant_update_success
		flash[:notice] = 'The restaurant has been updated'
		redirect_to '/restaurants'
	end

	def _restaurant_delete_success
		flash[:notice] = 'The restaurant has been removed'
		redirect_to '/restaurants'
	end

	def _restaurant_create_success
		flash[:notice] = 'Your restaurant has been added'
		redirect_to '/restaurants'
	end

	def _restaurant_create_error(errors)
		flash[:errors] = errors
	end

	def _restaurant_list
		Restaurant.all.reverse
	end

end
