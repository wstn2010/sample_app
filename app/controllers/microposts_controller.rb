class MicropostsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

	# def create
	# 	@micropost = current_user.microposts.build(micropost_params)
	# 	if @micropost.save
	# 		flash[:success] = "Micropost created!"
	# 		redirect_to root_url
	# 	else
	# 		@feed_items = []
	# 		render 'static_pages/home'
	# 	end
	# end

	def create
	    if !signed_in?
	      redirect_to root_url
	    else

			@micropost = current_user.microposts.build(micropost_params)

			if @micropost.save
				flash[:success] = "商材を追加しました!"
				redirect_to user_url(current_user)
			else
	    		render 'new'
			end

	    end
	end


	def destroy
		@micropost.destroy
		redirect_to root_url
	end

	def new
    	@micropost = Micropost.new
	end

	private

		def micropost_params
			params.require(:micropost).permit(
				:title,
				:category,
				:short_desc,
				:desc,
				:rep_short_desc,
				:rep_desc,
				:goods_seq,
				:maker,
				:pic_url
			)
		end

		def correct_user
			@micropost = current_user.microposts.find_by(id: params[:id])
			redirect_to root_url if @micropost.nil?
		end
end

