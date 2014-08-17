class Rubbish < ActiveRecord::Base

	validates 	:user_id, presence: true
	validates 	:review_id, presence: true

	validates 	:user_id, uniqueness: { scope: :review_id,
																			message: 'you can only rubbish a review once'}

	belongs_to 	:review
	belongs_to 	:user

end
