class UserMailer < ActionMailer::Base
  	default from: "from@example.com"

  	def purchase_email(order)
		@user = order.user
		@order = order
		@address = order.address
		mail(to: @user.email, subject: 'Your Purchase on Seeds of Pandora')
  	end
  	def shipping_email(order)
  		@order = order
  		@user = @order.user
  		mail(to: @user.email, subject: 'Your Seeds of Pandora Order has shipped!')
  	end
end
