module ReviewsHelper

	MAX_RATING = 5

	def star_rating(rating)
		return 'N/A' unless rating.respond_to?(:round)
		('★' * rating.round) + ('☆' * (MAX_RATING - rating.round))
	end

end
