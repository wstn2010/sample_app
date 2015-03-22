class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(rep_id: params[:session][:rep_id])
		if user && user.authenticate(params[:session][:password])
			sign_in user
			#redirect_back_or user
			redirect_to root_url
		else
			flash.now[:error] = 'Invalid rep_id/password combination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end

end
