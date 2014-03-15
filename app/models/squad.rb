class Squad < ActiveRecord::Base
	validates_presence_of :name
	
	has_many :players
	has_many :tweets, as: :tweetable
end
