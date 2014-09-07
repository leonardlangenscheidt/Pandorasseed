Rails.configuration.stripe = {
  :publishable_key => 'pk_test_ryUYGDCxguN4NGM4BVXPf61T',
  :secret_key      => 'sk_test_iHEjq1dUXDrqpzC8yIattMIm'
}
# Rails.configuration.stripe = {
#   :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
#   :secret_key      => ENV['STRIPE_SECRET_KEY']
# }


Stripe.api_key = Rails.configuration.stripe[:secret_key]
