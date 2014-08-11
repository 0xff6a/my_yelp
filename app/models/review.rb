class Review < ActiveRecord::Base

	validates :rating, presence: true, numericality: true
	validates :comment, length: { maximum: 150 }

	belongs_to :restaurant

end
