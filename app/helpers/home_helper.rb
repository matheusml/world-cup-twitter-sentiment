module HomeHelper
	def active_squad_class(active_squad, squad)
		if active_squad == squad
			'active'
		end
	end

	def generate_badge_class(percent)
		if percent >= 75
			'badge-success'
		elsif percent >= 50
			'badge-warning'
		else
			'badge-important'
		end
	end
end
