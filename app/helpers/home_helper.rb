module HomeHelper
	def active_squad_class(active_squad, squad)
		if active_squad == squad
			'active'
		end
	end
end
