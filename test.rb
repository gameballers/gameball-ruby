require "./lib/gameball"
Gameball.api_key = "b4348b319dce4befb6c6368f95b89bf1"
Gameball::transaction_key = "57c30efc9acc49f1b9a582faacabd2d3"
Gameball::api_version="v3.0"
# res=Gameball::Order.send_order({
#     playerUniqueId:"player456",   
#     orderId: "12331121",
#     totalPrice: "100",
#     totalPaid: "90"
#   })
# res=Gameball::Transaction.list_transaction({
#     page:2,status:1,limit:2
#  })

res=Gameball::Configurations.get_configurations()
puts res.body