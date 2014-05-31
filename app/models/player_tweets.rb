class PlayerTweets
	def self.tweets_percentage(player, dates)
		percentages = []

		dates.each do |date|
			split_date = date.split('/')
			day = split_date[0].to_i
			month = split_date[1].to_i
			current_date = Date.new(2014, month, day)

			tweets = player.tweets.where(:date => current_date)

			if tweets.present?
				positive = tweets.where(:positive => true).count
				percentages << (positive * 100) / tweets.count
			end	
		end

		percentages
	end

	def self.total_percentages(player)
		total_tweets = player.tweets.count
		total_positive_count = player.tweets.where(:positive => true).count
		if total_tweets > 0
			( total_positive_count * 100 ) / total_tweets 	
		else
			0
		end
	end
end