module StaticPagesHelper

	def controllable?(goods)
		current_user?(goods.user)
	end

	def deletable?(goods)
		!zero_goods?(goods)
	end

	private

		def zero_goods?(goods)
			goods.goods_seq == 0
		end

end
