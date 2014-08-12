class Review < ActiveRecord::Base

	VALID_RATING = (0..5)

	validates 							:rating, presence: true, numericality: true
	validates_inclusion_of 	:rating, :in => VALID_RATING
	validates 							:comment, length: { maximum: 150 }
	validates 							:restaurant_id, presence: true
	validates 							:user_id, presence: true
	validates 							:restaurant_id, uniqueness: { scope: :user_id,
    																										message: 'you cannot post multiple reviews' }
	validate 								:creator_cannot_validate_restaurant

	belongs_to :restaurant
	belongs_to :user

	private

	def creator_cannot_validate_restaurant
		if restaurant && user_id == restaurant.user_id
			errors.add(:user_id, 'you cannot review a restaurant you create')
		end
	end

end
