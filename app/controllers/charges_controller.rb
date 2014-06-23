class ChargesController < ApplicationController
	def create
	  	# Amount in cents
	  	@amount = 1000

	  	customer = Stripe::Customer.create(
			:email => current_user.email,
			:card  => params[:stripeToken]
	  	)

	  	charge = Stripe::Charge.create(
			:customer    => customer.id,
			:amount      => @amount,
			:description => "Pandora's Seed Customer",
			:currency    => 'usd'
	  	)

	  	@seeds = []

	  	@allseeds = Seed.all
	  	@allseeds.each do |seed|
	  		@seeds.push(seed.id)
	  	end

	  	@userorders = current_user.orders
	  	@userorders.each do |order|
	  		@seeds.delete(order.seed_id)
	  	end


		if @seeds.length>0
	  		current_user.orders.create(
	  			:user_id => current_user.id,
	  			:seed_id => @seeds[rand(@seeds.length)])
	  	else
	  		current_user.orders.create(
	  			:user_id => current_user.id,
	  			:seed_id => rand(@as.count))
  		end


	  	redirect_to '/success'

		rescue Stripe::CardError => e
	  	flash[:error] = e.message

	end
end
