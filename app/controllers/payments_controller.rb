class PaymentsController < ApplicationController
  
  def create
    token = params[:stripeToken]
    @product = Product.find(params[:id])

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => @product.price_in_cents,
        :currency => "eur",
        :source => token,
        :description => current_user.email # params[:stripeEmail]
      )

      Order.create! product: @product, user: current_user

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err  = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
      redirect_to product_path(@product)
    end

  end

end