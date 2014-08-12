class Restaurant < ActiveRecord::Base
	
	validates :name, 		presence: true, length: { maximum: 150 }
	validates :cuisine, presence: true, length: { maximum: 150 }
	validates :user_id, presence: true

	has_many 		:reviews, dependent: :destroy
	belongs_to 	:user
end
