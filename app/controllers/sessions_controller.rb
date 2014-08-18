class SessionsController < ApplicationController

	def new
		# @user = User.new
		# if current_user
			# redirect_to photos_path
		end
	end

	def create
		user = User.where(email: params[:email]).first
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to photos_path
		else
			flash.now.alert = "Email or password is invalid"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end

  

  
