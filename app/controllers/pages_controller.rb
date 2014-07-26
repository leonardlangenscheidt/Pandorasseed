class PagesController < ApplicationController

	def home
	end

	def buy
		@name = params[:n]
		@street = params[:s1]
		@street2 = params[:s2]
		@city = params[:c]
		@zip = params[:z]
		@state = params[:s]
		@premium = params[:p]
	end

	def confirm
		@name = params[:n]
		@street = params[:s1]
		@street2 = params[:s2]
		@city = params[:c]
		@zip = params[:z]
		@state = params[:s]
		if params[:p] = 'true'
			@premium = true
		else
			@premium = false
		end
		if @name==nil||@street==nil ||@city==nil ||@zip.length<5 ||@state==nil
			flash[:notice]='Please complete all fields'
			redirect_to buy_path(:n=>@name, :s1=>@street, :s2=>@street2, :c=>@city, :z=>@zip, :s=>@state)
		end
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
