require_relative 'utils'
require 'json'

class SmoothCodeAuth
    def initialize(request_hmac, client_secret)
        @request_hmac = request_hmac
        @client_secret = client_secret
    end

    def dashboard_request?(shop)
        generate_hmac(@client_secret, shop) == @request_hmac
    end

    def webhook_request?(webhook_data)
        generate_hmac(@client_secret, webhook_data.to_json) == @request_hmac
    end
end
