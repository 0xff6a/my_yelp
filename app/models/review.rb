class Review < ActiveRecord::Base

	VALID_RATING = (0..5)

	validates 							:rating, presence: true, numericality: true
	validates_inclusion_of 	:rating, :in => VALID_RATING
	validates 							:comment, length: { maximum: 150 }
	validates 							:restaurant_id, presence: true
	validates 							:user_id, presence: true
	validates 							:restaurant_id, uniqueness: { scope: :user_id,
    																										message: 'You cannot post multiple reviews' }
	belongs_to :restaurant
	belongs_to :user

end
