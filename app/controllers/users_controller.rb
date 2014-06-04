class UsersController < ApplicationController
	def index
	end

	def edit
		@user = User.find(params[:id])
		@user.update_attributes(:admin => 'true')
		redirect_to @user
	end
	
	def show
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(params[:id])
			if @user != current_user
				@user.destroy
				redirect_to root_path
			else
				flash[:error] = "Not possible"
			end
	end
end
