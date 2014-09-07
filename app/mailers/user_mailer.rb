class UserMailer < ActionMailer::Base
  	default from: "seedsofpandora@gmail.com"

  	def purchase_email(order)
		@user = order.user
		@order = order
		mail(to: @user.email, subject: 'Your Purchase on Seeds of Pandora')
  	end
  	def shipping_email(order)
  		@order = order
  		@user = @order.user
  		mail(to: @user.email, subject: 'Your Seeds of Pandora Order has shipped!')
  	end
end
