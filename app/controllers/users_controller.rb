class UsersController < ApplicationController
	def index
		@users = User.all
		redirect_to login_path if !current_user
	end

	def new
		@user = User.new
		# redirect_to login_path if !current_user
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_url, notice: "Thank you for signing up!"
			# redirect_to login_path if !current_user
		else
			render "new"
		end
	end

	def show
		@user = User.find(params[:id])
		redirect_to login_path if !current_user
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
end
