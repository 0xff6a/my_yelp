class Review < ActiveRecord::Base

	validates 							:rating, presence: true, numericality: true
	validates_inclusion_of 	:rating, :in => 0..5
	validates 							:comment, length: { maximum: 150 }
	validates 							:restaurant_id, presence: true
	
	belongs_to :restaurant
	belongs_to :user

end
