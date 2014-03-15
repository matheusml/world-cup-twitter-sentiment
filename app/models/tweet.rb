class Tweet < ActiveRecord::Base
	belongs_to :tweetable, polymorphic: true
end
