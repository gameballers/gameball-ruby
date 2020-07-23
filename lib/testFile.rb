require_relative './gameball'
Gameball::api_key="7c7636658209418c9a82306a421f76a5"
Gameball::api_version="v1.0"
Gameball::transaction_key="26e1967d89114388bdd1772587c336c8"
# res=Gameball::Transaction.balance("uniqueKey00")
res=Gameball::Player.create({

})
# res=Gameball::Transaction.hold({
#   # playerUniqueId:"uniqueKey00",
#   holdReference:"a4bb156c-58aa-4d33-b1b5-4477423f8ad3",
#   transactionTime:Time.now.utc
# })
# res=Gameball::Referral.refer({
#     PlayerCode:"Uen3FBBCB65D2Q",
#     PlayerUniqueId:"1595374922629"
# })
puts res.body
# puts Gameball::Helper::hashBody(playerUniqueId:"123",transactionId:"34",transactionTime:Time.now.utc)

