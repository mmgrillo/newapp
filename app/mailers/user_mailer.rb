class UserMailer < ApplicationMailer
	default from: "manuel@monte-defesa.com"
	
	def contact_form(email, name, message)
		@message = message
		mail(:from => email,
					:to => 'mmgrillo1@gmail.com',
					:subject => "A new contact form message from #{name}")
	end

	def welcome_email(user)
		@user = user
		@url = "/sign_up"
		mail(to: @user.email, subject: "Thanks for registering.")
	end

end
