class PagesController < ApplicationController

	def home
	end

	def buy
		@gift = params[:gift]
		@premium = params[:premium]
	end

	def address
		@name = params[:name]
		@street1 = params[:street1]
		@street2 = params[:street2]
		@city = params[:city]
		@zip = params[:zip]
		@state = params[:state]
		@message = params[:message]
		@gift = params[:gift]
		@premium = params[:premium]
	end

	def confirm
		@name = params[:name]
		@street1 = params[:street1]
		@street2 = params[:street2]
		@city = params[:city]
		@zip = params[:zip]
		@state = params[:state]
		@message = params[:message]
		@gift = params[:gift]
		@premium = params[:premium]
		if @name==nil||@street1.length==0 ||@city==nil ||@zip.length<5 ||@state==nil
			flash[:notice]='Please complete all fields correctly'
			redirect_to address_path(:name=>@name, :street1=>@street1, :street2=>@street2, :city=>@city, :zip=>@zip, :state=>@state, :premium => @premium, :gift => @gift, :message => @message)
		end
	end

	def order
		@order = Order.find(params[:id])
	end

	def orders
		@orders = Order.all
	end

	def ship
		@order = Order.find(params[:id])
		@order.shipped = true
		@order.save
		#mailer
		redirect_to orders_path
	end

	def success
	end

	def howto
		@id = params[:id]
	end

	def profile
		if signed_in?
			@user = current_user
		else
			redirect_to root_path
		end
	end
end
