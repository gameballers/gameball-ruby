require_relative "./lib/gameball"
Gameball.api_version="v3.0"
Gameball.api_key="184be486ad124379a8d1bf6dbe59cd8b"
Gameball.transaction_key="5cd1cb2bef9f475c85e8d2a6edd85894"




res= Gameball::Player.initialize_player({
    playerUniqueId:"player121233",
    mobile: "+1234567",
    email: "jon.snow@example.com",
    playerAttributes:{
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
puts res.body