Rails.configuration.stripe = {
  :publishable_key => ENV['public_key'],
  :secret_key      => ENV['private_key']
}

Stripe.api_key = Rails.configuration.stripe[:private_key]