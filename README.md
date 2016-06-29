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

# require the khepri connector gem
# You need to install it with :
#  $ gem install khepri_connector
#
require 'khepri_connector'

# setting you're khepri parameters
# 
# Initialize the client with your  API-Key. You can find it on your Khepri account.
# you can create your instance with your khepri account 
# 
khepri_url ='http://sb.khepri.tech'
api_key = 'MY_APi_KEY'
instance_id = 1

# create your Khepri object
kh = Khepri.new(khepri_url, api_key, instance_id)

# Simple ask
answer = kh.ask
# ask method return a JSON object like {"status":"success","solution":"a_solution"}
# you can access to the solution if you want 
puts answer["solution"]

# Simple success
kh.success(answer)
```


see exemples on http://khepri.tech/

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

