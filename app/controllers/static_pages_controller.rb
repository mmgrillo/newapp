class StaticPagesController < ApplicationController
  helper ProductsHelper

  def index
  end
  
  def landing_page
    @products = Product.limit(6)
  end
  

  def say_thank_you
	  @name = params[:name]
    email = params[:email]
	  @message = params[:message]
    UserMailer.say_thank_you(email, @name, @message).deliver

    ActionMailer::Base.mail(:from => email, 
      :to => 'manuel@monte-defesa.com', 
      :subject => "A new contact form message from #{@name}", 
      :body => @message).deliver

    #ActionMailer::Base.mail(
    #   from: "contact@manel_shop.com",
    #   to:   @email,
    #   subject: "Thank you for your message",
    #   body: "We will come back to you shortly."
    #  ).deliver
    
  end
end


