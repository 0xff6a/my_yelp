class RestaurantsController < ApplicationController

	include RestaurantsHelper

	def index
		@restaurants = _restaurant_list
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		new_restaurant = Restaurant.create(params[:restaurant].permit(:name, :cuisine))
		new_restaurant.save ? _restaurant_create_success : _restaurant_create_error(new_restaurant)
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		target_restaurant = Restaurant.find(params[:id]).update(params[:restaurant].permit(:name, :cuisine))
		target_restaurant ? _restaurant_update_success : _restaurant_update_error(target_restaurant)
	end

	def destroy
		target_restaurant = Restaurant.find(params[:id])
		target_restaurant.delete ? _restaurant_delete_success : _restaurant_delete_error(target_restaurant)
	end

end
