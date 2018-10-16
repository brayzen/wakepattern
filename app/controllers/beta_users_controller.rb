class BetaUsersController < ApplicationController
	def index
		@beta_users = BetaUser.all
	end

	def new
		@receiver = session[:receiver]
		@beta_user = BetaUser.new
	end

	def show
	end

	def create
		beta_user = BetaUser.new(beta_user_params)

	  if beta_user.save
			render :show
		else
			render :new 
		end
  end	
	
private

	def beta_user_params
		params.require(:beta_user).permit(:email, :phone, :first_name, :last_name)
	end
	
end
