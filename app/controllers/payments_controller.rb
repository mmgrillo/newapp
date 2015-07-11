class PaymentsController < ApplicationController
  
def create
  token = params[:stripeToken]
  @product = Product.find_by!(params[:id])

  # Create the charge on Stripe's servers - this will charge the user's card
  begin
    charge = Stripe::Charge.create(
      :amount => (@product.price*100).to_i,
      :currency => "usd",
      :source => token,
      :description => params[:stripeEmail]
    )
  rescue Stripe::CardError => e
    # The card has been declined
    body = e.json_body
    err  = body[:error]
    flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
  end
  #redirect_to product_path(@product)
end

end