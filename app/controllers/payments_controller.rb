class PaymentsController < ApplicationController
    
  def create
    #if current_user
      # signed in user
    #else
      # non-signed in user
      # 1. user needs to be presented with the page to sign in
      #    If the user does not have an account, he will chose to sign up,
      #    and then sign in automatically.
      # 2.   
    #end

    token = params[:stripeToken]
    @product = Product.find(params[:id])

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => @product.price_in_cents,
        :currency => "eur",
        :source => token,
        :description => current_user.present? ? current_user.email : params[:stripeEmail],
        :metadata => {
          :product_name => @product.name
        }
      )

      if current_user
        Order.create! product: @product, user: current_user
      else
        UserMailer.send_confirmation_to_guest(@product.id, params[:stripeEmail]).deliver 
      end  

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err  = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
      redirect_to product_path(@product)
    end

  end

end