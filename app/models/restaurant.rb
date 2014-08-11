class Restaurant < ActiveRecord::Base
	
	validates :name, presence: true, length: { maximum: 150 }
	validates :cuisine, presence: true, length: { maximum: 150 }

	has_many :reviews, dependent: :destroy

end
