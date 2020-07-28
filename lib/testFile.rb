require_relative './gameball'
Gameball::api_key="7c7636658209418c9a82306a421f76a5"
Gameball::api_version="v2.0"
Gameball::transaction_key="26e1967d89114388bdd1772587c336c8"
# res=Gameball::Transaction.balance("uniqueKey00")
res=Gameball::Player.initialize_player({playerUniqueId:"uniquekeys120",playerAttributes:{displayName:"Souidan",firstName:"Souidan1",lastName:"Souidan2",email:"alisouidan@gmail.com",gender:"Male",mobileNumber:"+201002580909",dateOfBirth:Time.now.utc,joinDate:Time.now.utc}})
# res=Gameball::Transaction.hold_points({
#   playerUniqueId:"uniqueKey00",
#   amount:2,
#   transactionTime:Time.now.utc
# })
# res=Gameball::Transaction.redeem_points({
#     holdReference:"c61153e4-fc79-4b1c-adce-f789bc061fe9",
#     playerUniqueId:"uniqueKey00",
#     amount:2,
#     transactionOnClientSystemId:12,
#     transactionTime:Time.now.utc
# })
# res=Gameball::Transaction.reverse_transaction({
#     playerUniqueId:"uniqueKey00",
#     transactionOnClientSystemId:12,
#     reversedTransactionOnClientSystemId:12,
#     transactionTime:Time.now.utc
# })
# res=Gameball::Transaction.reverse_hold({
#     playerUniqueId:"uniqueKey00",
#     holdReference:"80144eaa-8e5b-4c6b-8f4d-58f0d8766797",
#     transactionTime:Time.now.utc
# })

# res=Gameball::Referral.refer({
#     playerCode:"Uen3FBBCB65D2Q",
#     playerUniqueId:"1595374922629"
# })
# res=Gameball::Transaction.reward_points({
#  playerUniqueId:"uniqueKey00",
#   amount:100,
#   transactionTime:Time.now.utc,
#   transactionOnClientSystemId:"1232344",

# })
p res
puts res.code==='200'

# # puts Gameball::Helper::hashBody(playerUniqueId:"123",transactionId:"34",transactionTime:Time.now.utc)
#   res=Gameball::Event.sendEvent({
#     events:{view_product_page:{customer_id:"123",product_id:"123",product_title:"title",product_vendor:"vendor",shop_name:"shop"}},
#     playerUniqueId:"uinqueKeys123"
# }) #Check the sinatra server window for the output.
#     p res
# sleep 5  #Do some time consuming task.
#     p res
#   puts "Sending response..."
#        #The response(which the rails app ignores).
