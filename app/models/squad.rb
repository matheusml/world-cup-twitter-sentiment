class Squad < ActiveRecord::Base
	validate_presence_of :name
end
