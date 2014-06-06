class Squad < ActiveRecord::Base
	validates_presence_of :name
	
	has_many :players, :dependent => :destroy
	has_many :tweets, as: :tweetable
end
