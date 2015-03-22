class MicropostsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

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
		redirect_to user_url(current_user)
	end

	def new
    	@micropost = Micropost.new

    	latest = current_user.microposts.order("goods_seq DESC").first

    	@micropost.pic_url = "/assets/NA.jpg"
    	
    	if latest
	    	@micropost.goods_seq = latest.goods_seq + 1
	    	@micropost.maker = latest.maker
	    	@micropost.category = latest.category
	    else
	    	@micropost.goods_seq = 0
	    end
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

