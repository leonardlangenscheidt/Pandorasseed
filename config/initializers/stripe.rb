Rails.configuration.stripe = {
  :publishable_key => 'pk_test_ryUYGDCxguN4NGM4BVXPf61T',
  :secret_key      => 'sk_test_iHEjq1dUXDrqpzC8yIattMIm'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
