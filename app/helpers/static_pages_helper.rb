module StaticPagesHelper

	def controllable?(goods)
		current_user?(goods.user)
	end
end
