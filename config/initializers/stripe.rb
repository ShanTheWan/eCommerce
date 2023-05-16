Rails.configuration.stripe = {
<<<<<<< HEAD
  :publishable_key => Rails.application.credentials.stripe[:stripe_publishable_key],    
  :secret_key => Rails.application.credentials.stripe[:stripe_secret_key]    
}    
Stripe.api_key = Rails.application.credentials.stripe[:stripe_secret_key]
=======
  :publishable_key => ENV['public_key'],
  :secret_key      => ENV['private_key']
}

Stripe.api_key = Rails.configuration.stripe[:stripe_secret_key]

>>>>>>> aad343ae79fb3ec84a4d3b0e830e531467c84dbd
