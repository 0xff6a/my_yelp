class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def create
		name, cuisine = params[:restaurant].values
		new_restaurant = Restaurant.create(:name => name, :cuisine => cuisine)
		if new_restaurant
		 	flash[:notice] = 'Your restaurant has been added'
		else 
			flash[:errors] = new_restaurant.errors
		end

		@restaurants = Restaurant.all
		render 'index'
	end

	def destroy
		target_restaurant = Restaurant.find(params[:id])
		target_restaurant.delete
		flash[:notice] = 'The restaurant has been removed'
		@restaurants = Restaurant.all
		render 'index'
	end

end
