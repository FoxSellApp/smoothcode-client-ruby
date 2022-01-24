# SmoothCode Client Ruby

## Introduction
Ruby Client that exposes utility functions to authenticate SmoothCode requests

## Installation
```shell
gem install smoothcode
```

## Usage
This library exposes 2 methods
* `dashboard_request?(shop)` - This method verifies if the request for accessing the dashboard is coming from `SmoothCode`
```ruby
require 'smoothcode'

# SmoothCode sends query parameters to the URL
# shop -> Shopify Shop in the form: `test.myshopify.com`
# hmac -> HMAC of the shop signed by your App Client Secret (can be obtained from SmoothCode Dashboard in App Settings)

SmoothCodeAuth.new(request_hmac, client_secret).dashboard_request?(shop) # returns True if the request is valid
```

* `webhook_request?(webhook_data)` - This method verifies if the webhook request is coming from `SmoothCode`
```ruby
require 'smoothcode'

# SmoothCode sends hmac in the Authorization Header of the request
# It is hmac of the webhook data signed by your App Client Secret

SmoothCodeAuth.new(request_hmac, client_secret).webhook_request?(webhook_data) # returns True if the request is valid
```
***
