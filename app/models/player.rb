class Player < ActiveRecord::Base
	validates_presence_of :name
	
	belongs_to :squad
	has_many :tweets, as: :tweetable
end
