require_relative "./gameball"
Gameball::api_key = "7c7636658209418c9a82306a421f76a5"
Gameball::api_version = "v2.0"
Gameball::transaction_key = "26e1967d89114388bdd1772587c336c8"
# res=Gameball::Transaction.get_player_balance("uniqueKey00")
# res = Gameball::Player.initialize_player({ playerUniqueId: "uniquekeys120", playerAttributes: { displayName: "Souidan", firstName: "Souidan1", lastName: "Souidan2", email: "alisouidan@gmail.com",
#                                                                                               gender: "Male", mobileNumber: "+201002580909",
#                                                                                               dateOfBirth: Date.parse("10/10/2010"), joinDate: Time.now.utc } })
res= Gameball::Action.send_action({ playerUniqueId: "player123",events:{
review:{},
reserve:{rooms:2}
        
      },
      pointsTransaction:{
            rewardAmount:2,
            transactionId:12
      }
      }
     )                                                                                            
# res=Gameball::Transaction.hold_points({
#   playerUniqueId:"uniqueKey00",
#   amount:2,
#   transactionTime:Time.now.utc
# })
# res=Gameball::Transaction.redeem_points({
#     holdReference:"c61153e4-fc79-4b1c-adce-f789bc061fe9",
#     playerUniqueId:"uniqueKey00",
#     amount:2,
#     transactionId:12,
#     transactionTime:Time.now.utc
# })
# res=Gameball::Transaction.reverse_transaction({
#     playerUniqueId:"uniqueKey00",
#     transactionId:12,
#     reversedTransactionId:12,
#     transactionTime:Time.now.utc
# })
# res=Gameball::Transaction.reverse_hold({
#     playerUniqueId:"uniqueKey00",
#     holdReference:"80144eaa-8e5b-4c6b-8f4d-58f0d8766797",
#     transactionTime:Time.now.utc
# })

# res=Gameball::Referral.create_referral({
#    playerCode:"CODE11",
#    playerUniqueId:"player456"
# }
# )
# res=Gameball::Player.get_player_info("uniqueKey00")
# res=Gameball::Transaction.reward_points({
#  playerUniqueId:"uniqueKey00",
#   amount:100,
#   transactionTime:Time.now.utc,
#   transactionId:"1232344",

# })
#   res=Gameball::Event.sendEvent({
#    events:{
#       reserve:{
#          rooms:2
#   	}
#    },
#    playerUniqueId:" player123",
#    playerAttributes:{
#       displayName:" Jon Snow",
#       email:"jon.snow@example.com",
#       dateOfBirth:"1980-09-19T00:00:00.000Z",
#       joinDate:"2019-09-19T21:06:29.158Z",
#   	custom:{
#          location:"Miami",
#          graduationDate:"2018-07-04T21:06:29.158Z",
#          isMarried:false
#   	}

#    }
# }

# )
# res=Gameball::Event.sendEvent({
#         events:{view_product_page:{customer_id:"123",product_id:"123",product_title:"title",product_vendor:"vendor",shop_name:"shop"}},
#         playerUniqueId:"uniquekeys120",
#         playerAttributes:{displayName:"Souidan",firstName:"Souidan1",lastName:"Souidan2",email:"alisouidan1@gmail.com",gender:"Male",mobileNumber:"+201002580909",dateOfBirth:"0123",joinDate:Time.now.utc}
#         })
p res.body
# p res
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
