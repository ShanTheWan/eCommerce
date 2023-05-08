class CheckoutsController < ApplicationController
    before_action :authenticate_user!

    def show
        current_user.set_payment_processor :stripe
        current_user.payment_processor.pay_customer

        @checkout_session = current_user
            .payment_processor
            .checkout(
                mode: 'payment',
                line_items: 'price_1N5WVXHXI4ygjXXrIgf2poI6',
                success_url: checkout_success_url,
            )
    end


    def success
    end
end
