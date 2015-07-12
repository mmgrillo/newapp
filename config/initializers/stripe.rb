
if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key      => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_l1WuY4whRzEVpxSfu3VL2t94',
    :secret_key      => 'sk_test_voZzNNncGOKFh9Xq0wMkp26B'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]