class UserMailer < ApplicationMailer
	
	def say_thank_you(email, name, message)
		@message = message # e.g. "I want to buy something"
		@name = name
		mail(:to => email,
				 :subject => "Thanks for contacting us")
	end

	def welcome_email(user)
		@user = user
		@url = "/sign_up"
		mail(to: @user.email, subject: "Thanks for registering.")
	end

end
