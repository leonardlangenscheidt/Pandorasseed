class PagesController < ApplicationController

	def home
	end

	def buy
	end

	def success
	end

	def howto
	end

	def profile
		if signed_in?
			@user = current_user
		else
			redirect_to root_path
		end
	end
end
