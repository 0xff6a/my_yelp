class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def create
		name = params[:restaurant][:name]
		cuisine = params[:restaurant][:cuisine]
		Restaurant.create(:name => name, :cuisine => cuisine)
		flash[:notice] = 'Your restaurant has been added'
		@restaurants = Restaurant.all
		render 'index'
	end

end
