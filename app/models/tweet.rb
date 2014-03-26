class Tweet < ActiveRecord::Base
	validates_presence_of :text, :date

	belongs_to :tweetable, polymorphic: true
end
