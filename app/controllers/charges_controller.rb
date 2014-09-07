class ChargesController < ApplicationController
	def create
	  	# Amount in cents
	  	if @premium == 'true'
	  		@amount = 2500
	  	else
	  		@amount = 1000
	  	end

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

	  	#creating a list of possible seeds
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
	  		@order = Order.create(
	  			:user_id => current_user.id,
	  			:seed_id => @seeds[rand(@seeds.length)+1],
	  			:gift => false,
	  			:shipped => false,
	  			:premium => false,
	  			:message => params[:message],
	  			:name => params[:name],
	  			:street1 => params[:street1],
	  			:street2 => params[:street2],
	  			:city => params[:city],
	  			:state => params[:state],
	  			:zip => params[:zip].to_i
	  			)
	  	else
	  		@order = Order.create(
	  			:user_id => current_user.id,
	  			:seed_id => rand(@allseeds.length)+1,
	  			:gift => false,
	  			:shipped => false,
	  			:premium => false,
	  			:message => params[:message],
	  			:name => params[:name],
	  			:street1 => params[:street1],
	  			:street2 => params[:street2],
	  			:city => params[:city],
	  			:state => params[:state],
	  			:zip => params[:zip].to_i
	  			)
  		end

  		if params[:gift] == 'true'
  			@order.gift = true
  			@order.save
  		end

  		if params[:premium] == 'true'
  			@order.premium = true
  			@order.save
  		end

  		# UserMailer.purchase_email(@order).deliver

	  	redirect_to '/success'

		rescue Stripe::CardError => e
	  	flash[:error] = e.message

	end
end
