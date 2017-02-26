class SessionsController < ApplicationController
	def new

	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:id] = user.id
			redirect_to user
		else
			@errors = ["Sorry, the credentials provided do not match"]
			render '/login'
		end
	end

	def destroy
		session.clear
		redirect_to '/login'
	end
	
end
