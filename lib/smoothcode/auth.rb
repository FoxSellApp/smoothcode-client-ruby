require_relative 'utils'

class SmoothCodeAuth
    def initialize(request_hmac, client_secret)
        @request_hmac = request_hmac
        @client_secret = client_secret
    end

    def dashboard_request?(shop)
        generate_hmac(@client_secret, shop) == @request_hmac
    end

    def webhook_request?(webhook_data)
        webhook_data = webhook_data.transform_keys(&:to_sym)
        webhook_id = webhook_data[:shopify_webhook_uuid]

        generate_hmac(@client_secret, webhook_id.to_s) == @request_hmac
    end

    def gdpr_webhook_request?(webhook_data)
        webhook_data = webhook_data.transform_keys(&:to_sym)
        shop_id = webhook_data[:shop_id]

        generate_hmac(@client_secret, shop_id.to_s) == @request_hmac
    end
end
