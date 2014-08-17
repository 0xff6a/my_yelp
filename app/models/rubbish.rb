class Rubbish < ActiveRecord::Base

	validates 	:user_id, presence: true
	validates 	:review_id, presence: true

	belongs_to 	:review
	belongs_to 	:user

end
