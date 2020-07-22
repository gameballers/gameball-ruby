require_relative './gameball'
Gameball::api_key="7c7636658209418c9a82306a421f76a5"
Gameball::api_version="v1.0"
res=Gameball::Event.sendEvent({
    events: {
    view_product_page: {    
      customer_id: "100",
      product_id: "124",
      product_title:"guitar",
      product_vendor:"gibson",
      shop_name:"distingo"
    }  },
  playerUniqueId: "uniqueKey00"
})
puts res.body
# puts Gameball::Helper::hashBody(playerUniqueId:"123",transactionId:"34",transactionTime:Time.now.utc)

