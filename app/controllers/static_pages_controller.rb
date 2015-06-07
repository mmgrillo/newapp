class StaticPagesController < ApplicationController
  def index
  end
  
  def landing_page
    @products = Product.limit(3)
  end
  

  def say_thank_you
	  @name = params[:name]
	  @email = params[:email]
	  @message = params[:message]
    UserMailer.say_thank_you(@email, @name, @message).deliver

    ActionMailer::Base.mail(:from => @email, 
      :to => 'manuel@monte-defesa.com', 
      :subject => "A new contact form message from #{@name}", 
      :body => @message).deliver
  end
end
