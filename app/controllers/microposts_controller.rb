class MicropostsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

	def create
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
			flash[:success] = "Micropost created!"
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@micropost.destroy
		redirect_to root_url
	end

	def self.todays_goods(category)
		@microposts = Micropost.where('category=?', category).shuffle
		@microposts[0]
	end

	private

		def micropost_params
			params.require(:micropost).permit(
				:content, 
				:title,
				:key,
				:category,
				:whole_price,
				:shipping_cost,
				:short_desc,
				:desc,
				:rep_short_desc,
				:rep_desc
			)
		end

		def correct_user
			@micropost = current_user.microposts.find_by(id: params[:id])
			redirect_to root_url if @micropost.nil?
		end
end

