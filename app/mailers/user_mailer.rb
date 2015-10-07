class UserMailer < ApplicationMailer
	
	def say_thank_you(email, name, message)
		@message = message # e.g. "I want to buy something"
		@name = name
		mail(:to => email,
				 :subject => "Thanks for contacting us")
		# ActionMailer::Base.mail(:to => email, :subject => "Thansk.....")
	end

end
