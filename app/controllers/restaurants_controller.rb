class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def create
		name, cuisine = params[:restaurant].values
		new_restaurant = Restaurant.create(:name => name, :cuisine => cuisine)
		new_restaurant ? _restaurant_create_success : _restaurant_create_error(new_restaurant.errors)
		_display_index_view
	end

	def destroy
		target_restaurant = Restaurant.find(params[:id])
		target_restaurant.delete
		_restaurant_delete_success
		_display_index_view
	end

	def _restaurant_delete_success
		flash[:notice] = 'The restaurant has been removed'
	end

	def _restaurant_create_success
		flash[:notice] = 'Your restaurant has been added'
	end

	def _restaurant_create_error(errors)
		flash[:errors] = errors
	end

	def _display_index_view
		@restaurants = Restaurant.all
		render 'index'
	end

end
