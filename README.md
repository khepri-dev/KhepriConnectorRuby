# KhepriConnector

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'khepri_connector'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install khepri_connector

## Usage

```ruby
#!/usr/bin/ruby

# require ruby libs included in ruby - not install needed
require 'net/http'
require 'json'
#
# require the khepri connector gem
# You need to install it with :
#  $ gem install khepri_connector
#
require 'khepri_connector'

khepri_url ='http://test-khepridevelba-1t8aalo9fz0t1-723475646.eu-west-1.elb.amazonaws.com'
api_key = '213e71dd6e9f354de2c42eee366d4263'
instance_id = 3

kh = Khepri.new(khepri_url, api_key, instance_id)

# Simple ask
answer = kh.ask

# Simple success
kh.success(answer)
```


see exemples on http://khepri.tech/

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

