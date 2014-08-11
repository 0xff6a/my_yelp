class Review < ActiveRecord::Base

	validates 							:rating, presence: true, numericality: true
	validates_inclusion_of 	:rating, :in => 0..5
	validates 							:comment, length: { maximum: 150 }

	belongs_to :restaurant

end
