class Player < ActiveRecord::Base
	validates_presence_of :name
	belongs_to :squad
end
