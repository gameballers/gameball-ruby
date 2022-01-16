# Gameball Ruby SDK

The Gameball Ruby SDK provides convenient access to the Gameball API from applications written in the Ruby language.

## Documentation

Please refer to the [Gameball API docs](https://docs.gameball.co).

## Installation

You don't need this source code unless you want to modify the SDK. If you just
want to use the SDK, just run:

```sh
gem install gameball
```

### Requirements

- Ruby 2.3+ and Gem 3.0+

## Usage

The SDK needs to be configured with your account's API & Transaction keys available in your [Gameball Dashboard](https://help.gameball.co/en/articles/3467114-get-your-account-integration-details-api-key-and-transaction-key)

```ruby
require 'gameball'

Gameball.api_key="api_key"
Gameball.transaction_key="transaction_key"
# If using API Version 2.0
Gameball.api_version="v2.0"
```

### Examples

#### Create Player

```ruby
# Example 1
Gameball::Player.initialize_player({
   playerUniqueId:"player123",
   mobile: "+1234567",
   email: "jon.snow@example.com",
   "playerAttributes":{
      displayName:"Jon Snow",
      firstName: "Jon",
      lastName: "Snow",
      mobile: "+1234567",
      email:"jon.snow@example.com",
      gender:"M",
      dateOfBirth:DateTime.iso8601("1980-09-19T00:00:00.000Z"),
      joinDate:DateTime.iso8601("2019-09-19T21:06:29.158Z"),
      tags: "VIP,Platinum",
    	custom:{
           location:"Miami",
           graduationDate:"2018-07-04T21:06:29.158Z",
           isMarried:false
        }
    }
  })
# Example 2
Gameball::Player.initialize_player({
   referrerCode:"CODE11",
   playerUniqueId:"player456",
   playerAttributes:{
      displayName:" Tyrion Lannister",
      firstName:"Tyrion",
      lastName:"Lannister",
      email:"tyrion@example.com",
      gender:"M",
      dateOfBirth:DateTime.iso8601("1978-01-11T00:00:00.000Z"),
      joinDate:DateTime.iso8601("2019-09-19T21:06:29.158Z"),
      custom:{
         location:"Miami",
         graduationDate:"2018-07-04T21:06:29.158Z",
         isMarried:false
  	}
   })


```

#### Retrieve Player
```ruby
Gameball::Player.get_player_info("player123")

```

#### Player Balance
```ruby
Gameball::Player.get_player_balance("player123")

```

#### Player's Progress
```ruby
Gameball::Player.get_player_progress("player123")

```

#### Attach Tags to Player
```ruby
Gameball::Player.attach_tags("player123","VIP,Platinum")

```

#### Detach Tags
```ruby
Gameball::Player.detach_tags("player123","VIP,Platinum")

```

#### Sending an Event

```ruby
# Example 1
Gameball::Event.send_event({
	events:{
		place_order:{
			total_amount:"100",
			category:[
				"electronics",
				"cosmetics"
			]
		},
		review:{}
	},
	playerUniqueId:"player123"
})
# Example 2
Gameball::Event.send_event({
	events:{
		reserve:{
			rooms:2
		}
	},
	playerUniqueId:" player123"
	
})


```

#### Cashback Examples

```ruby
# Example 1
Gameball::Transaction.cashback({
	playerUniqueId:"player123",
	amount:99.98,
	transactionId:"tra_123456789"
})
```

#### Hold Points Example

```ruby
Gameball::Transaction.hold_points({
	playerUniqueId:"player456",
	amount:98.89
}
)
```

#### Redeem Example

```ruby
# Example 1
Gameball::Transaction.redeem_points({
	playerUniqueId:"player456",
	transactionId:"tra_123456789",
	holdReference:"2342452352435234",
	})

# Example 2
Gameball::Transaction.redeem_points({
	playerUniqueId:"player456",
	transactionId:"tra_123456789",
	redeemedAmount:12,
	})
```

#### Reverse Transaction Example

```ruby
Gameball::Transaction.refund({
   playerUniqueId:"player456",
   transactionId:"1234567890",
   reverseTransactionId:"234567891",
   amount: nil
}
)
```

#### Reverse Hold Example

```ruby
Gameball::Transaction.reverse_hold("9245fe4a-d402-451c-b9ed-9c1a04247482")
```

#### Manual Transaction Example

```ruby
Gameball::Transaction.manual_transaction({
   playerUniqueId:"player123",
   amount:99.98,
   transactionId:"tra_123456789",
   username: "admin_storename",
   reason: "Thank You Gift"
})
```

#### List Transactions Example

```ruby
Gameball::Transaction.list_transactions({
   page:2,
   limit:10
})
```

#### Order Examples

```ruby
Gameball::Order.place_order({
  playerUniqueId:"player456",   
  orderId: "6253e03b",
  totalPrice: "100",
  totalPaid: "90",
  totalDiscount: "0",
  totalShipping: "0",
  totalTax: "0", 
  lineItems:[
    {
      productId:"197765",
      tag: ["VIP"],
      category: [
        "natural",
        "cosmetics"
      ],
      weight: "20",
      vendor: "nike",
      collection: ["14313", "4343"],
    },
    {
      productId:"875511",
      title: "XPS-15s",
      category: [
        "electronics"
      ],
      vendor: "Dell"
    }
  ],
  discountCodes: [
      "AU7X-8Q7L",
      "BY3V-22GK"
  ],
  extra: {
    paymentMethod: "credit card",
    billingAddress: "Alabama"
  },
  redeemedAmount: 20,
  holdReference: nil,
  guest: false
})
```
#### Leaderboard 

```ruby
# Example 1
Gameball::Leaderboard.get_leaderboard()

# Example 2

Gameball::Leaderboard.get_leaderboard({limit: 5})
```

#### Get Player Notifications

```ruby
# Example 1
Gameball::Notifications.get_notifications("player123")

# Example 2
Gameball::Notifications.get_notifications("player123",{
	page: 2,
	limit: 10
})

```

#### Mark Player Notifications

```ruby
Gameball::Notifications.mark_notifications({notificationIds: ["123", "3441", "3245"]})

```

#### Configurations

```ruby
# Example 1
Gameball::Configurations.get_configurations()

# Example 2
Gameball::Configurations.get_configurations({lang: "en"})

```




### Testing

To test run in the terminal `bundle exec rspec spec`

### Handling exceptions

Unsuccessful requests raise exceptions. The raised exception will reflect the sort of error that occurred with appropriate message and error code . Please refer to the [Gameball API docs](https://docs.gameball.co).

## Contribution

The master branch of this repository contains the latest stable release of the SDK.

## Contact

For usage questions\suggestions drop us an email at support[ at ]gameball.co. Please report any bugs as issues.
