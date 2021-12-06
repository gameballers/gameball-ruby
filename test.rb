require "./lib/gameball"
Gameball.api_key="184be486ad124379a8d1bf6dbe59cd8a"
Gameball.transaction_key="5cd1cb2bef9f475c85e8d2a6edd85895"
Gameball.api_version="v3.0"
res=Gameball::Order.place_order({
    playerUniqueId:"player45126",   
    orderId: "6253e0123b",
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
  puts res.body