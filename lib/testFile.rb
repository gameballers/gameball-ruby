require_relative './gameball'
Gameball::api_key="7c7636658209418c9a82306a421f76a5"
Gameball::api_version="v1.0"
Gameball::transaction_key="26e1967d89114388bdd1772587c336c8"
# res=Gameball::Transaction.balance("uniqueKey00")
res=Gameball::Player.create({playerUniqueId:"uniquekeys123",playerAttributes:{displayName:"Souidan",firstName:"Souidan1",lastName:"Souidan2",email:"alisouidan@gmail.com",gender:"Male",mobileNumber:"+201002580909",dateOfBirth:Time.now.utc,joinDate:Time.now.utc}})
# res=Gameball::Transaction.hold({
#   playerUniqueId:"uniqueKey00",
#   amount:1,
#   transactionTime:Time.now.utc
# })
# res=Gameball::Referral.refer({
#     playerCode:"Uen3FBBCB65D2Q",
#     playerUniqueId:"1595374922629"
# })
puts res.body
# puts Gameball::Helper::hashBody(playerUniqueId:"123",transactionId:"34",transactionTime:Time.now.utc)

