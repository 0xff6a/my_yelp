class Restaurant < ActiveRecord::Base
	
	validates :name, 		presence: true, length: { maximum: 150 }
	validates :cuisine, presence: true, length: { maximum: 150 }
	validates :user_id, presence: true

	has_many 		:reviews, dependent: :destroy
	belongs_to 	:user

	def average_rating
		return 'N/A' unless reviews.any?
		reviews.average(:rating)
	end

end
