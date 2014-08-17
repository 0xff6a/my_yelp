class Rate < ActiveRecord::Base

	validates :user_id, uniqueness: { scope: :review_id,
																		message: 'you can only rate a review once'}

	belongs_to :review
	
end
