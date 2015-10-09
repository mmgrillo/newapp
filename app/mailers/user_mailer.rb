class UserMailer < ApplicationMailer
	
	def say_thank_you(email, name, message)
		@message = message # e.g. "I want to buy something"
		@name = name
		mail(:to => email,
				 :subject => "Thanks for contacting us")
		# ActionMailer::Base.mail(:to => email, :subject => "Thansk.....")
	end

  def send_order_confirmation_email(order_id)
    @order = Order.find(order_id)
    email = @order.user.email
    mail(to: email,
    	   subject: "Order Confirmation (No: #{@order.id})")
  end	

  def send_confirmation_to_guest(product_id, email)
  	@product = Product.find(product_id)
  	mail(to: email, subject: "Order Confirmation")
  end	
end
