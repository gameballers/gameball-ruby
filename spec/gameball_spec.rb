require "rspec"
require "./lib/gameball"
require_relative "../config"
RSpec.describe Gameball::Player do
	before (:each) {
    Gameball::api_key = Gameball::SECRET_API_KEY
    Gameball::transaction_key=Gameball::SECRET_TRANSACTION_KEY
 	}
	# Gameball::transaction_key=" "
  it "Initializes a new Gameball player" do
    playerUniqueId = rand 50000..10000000
		res = Gameball::Player.initialize_player({ playerUniqueId: playerUniqueId, playerAttributes: { displayName: "player", firstName: "player1", lastName: "player2", email: "aliplayer@gmail.com", gender: "Male", mobileNumber: "+201002580909", dateOfBirth: Time.now.utc, joinDate: Time.now.utc } })
		expect(res.code).to eq("200")
	end
	it "Initializes a new Gameball player 2" do
  	playerUniqueId = rand 50000..10000000
		res = Gameball::Player.initialize_player({ 
			playerUniqueId: playerUniqueId,
			playerAttributes: {
				displayName: "player",
				firstName: "player1",
				lastName: "player2",
				email: "aliplayer@gmail.com",
				gender: "Male", 
				mobileNumber: "+201002580909",
				dateOfBirth: Time.now.utc,
				joinDate: Time.now.utc,
				custom: {
					location: "Miami",
					graduationDate: "2018-07-04T21:06:29.158Z",
					isMarried: false,
				} } })
				expect(res.code).to eq("200")
			end
			it "Gets player info" do
		 		 				
				res = Gameball::Player.get_player_info("player123")
				expect(res.code).to eq("200")
			end
			context "When user doesn't include api_key" do
        it "Throws GameballError" do
          Gameball::api_key=nil
					playerUniqueId = rand 50000..10000000
					body = { playerUniqueId: playerUniqueId, playerAttributes: { displayName: "player", firstName: "player1", lastName: "player2", email: "aliplayer@gmail.com", gender: "Male", mobileNumber: "+201002580909", dateOfBirth: Time.now.utc, joinDate: Time.now.utc } }
					expect { Gameball::Player.initialize_player(body) }.to raise_error(Gameball::GameballError)
				end
			end
			context "When user doesn't include correct parameters" do
				it "Throws GameballError when removing playerUniqueId" do
			 		playerUniqueId = rand 50000..10000000
					body = { playerAttributes: { displayName: "player", firstName: "player1", lastName: "player2", email: "aliplayer@gmail.com", gender: "Male", mobileNumber: "+201002580909", dateOfBirth: Time.now.utc, joinDate: Time.now.utc } }
					expect { Gameball::Player.initialize_player(body) }.to raise_error(Gameball::GameballError)
				end
				it "Throws GameballError when sending empty body" do
			 		playerUniqueId = rand 50000..10000000
					body = {}
					expect { Gameball::Player.initialize_player(body) }.to raise_error(Gameball::GameballError)
				end
			end
			context "When user includes an incorrect date " do
				it "Throws GameballError" do
			 		playerUniqueId = rand 50000..10000000
					body = { playerUniqueId: playerUniqueId, playerAttributes: { displayName: "player", firstName: "player1", lastName: "player2", email: "aliplayer@gmail.com", gender: "Male", mobileNumber: "+201002580909", dateOfBirth: "0123", joinDate: Time.now.utc } }
					expect { Gameball::Player.initialize_player(body) }.to raise_error(Gameball::GameballError)
				end
			end
		end
		RSpec.describe Gameball::Event do
			it "create new event" do
		 		 	res = Gameball::Event.sendEvent({
					events: {
						review: {},
					},
					playerUniqueId: "player123",
				})
				expect(res).to eq(true)
			end
			it "create new event 2" do
		 		 				res = Gameball::Event.sendEvent({
					events: {
						reserve: {
							rooms: 2,
						},
					},
					playerUniqueId: "player123",
					playerAttributes: {
						displayName: "Jon Snow",
						email: "jon.snow@example.com",
						dateOfBirth: "1980-09-19T00:00:00.000Z",
						joinDate: "2019-09-19T21:06:29.158Z",
					},
				})
				expect(res).to eq(true)
			end
			it "create new event 3" do
		 		 				res = Gameball::Event.sendEvent({
					events: {
						reserve: {
							rooms: 2,
						},
						place_order: {
							total_amount: "100",
							category: [
								"electronics",
								"cosmetics",
							],
						},
						review: {},
					},
					playerUniqueId: " player123",
					playerAttributes: {
						displayName: " Jon Snow",
						email: "jon.snow@example.com",
						dateOfBirth: "1980-09-19T00:00:00.000Z",
						joinDate: "2019-09-19T21:06:29.158Z",
						custom: {
							location: "Miami",
							graduationDate: "2018-07-04T21:06:29.158Z",
							isMarried: false,
						},
											},
				})
				expect(res).to eq(true)
			end
			it "create new event 4" do
		 		 				res = Gameball::Event.sendEvent({
					events: {
						place_order: {
							total_amount: "100",
							category: [
								"electronics",
								"cosmetics",
							],
						},
					},
					playerUniqueId: "player123",
				})
				expect(res).to eq(true)
			end
		end
		# RSpec.describe Gameball::Referral do
		# 	it "Creates new player then new referral" do
		#  		playerUniqueId = rand 50000..10000000
		# 		res = Gameball::Player.initialize_player({ playerUniqueId: playerUniqueId, playerAttributes: { displayName: "player", firstName: "player1", lastName: "player2", email: "aliplayer@gmail.com", gender: "Male", mobileNumber: "+201002580909", dateOfBirth: Time.now.utc, joinDate: Time.now.utc } })
		# 		playerCode = JSON.parse(res.body)["referralCode"]
		# 		res = Gameball::Referral.create_referral({
		# 			playerCode: playerCode,
		# 			playerUniqueId: playerUniqueId,
		# 		})
		# 		expect(res).to eq(true)
		# 	end
		# 	it "Creates new player then new referral with player attributes" do
		#  		playerUniqueId = rand 50000..10000000
		# 		res = Gameball::Player.initialize_player({ playerUniqueId: playerUniqueId, playerAttributes: { displayName: "player", firstName: "player1", lastName: "player2", email: "aliplayer@gmail.com", gender: "Male", mobileNumber: "+201002580909", dateOfBirth: Time.now.utc, joinDate: Time.now.utc } })
		# 		playerCode = JSON.parse(res.body)["referralCode"]
		# 		res = Gameball::Referral.create_referral({
		# 			playerCode: playerCode,
		# 			playerUniqueId: playerUniqueId,
		# 			playerAttributes: {
		# 				displayName: " Jon Snow",
		# 				email: "jon.snow@example.com",
		# 				dateOfBirth: "1980-09-19T00:00:00.000Z",
		# 				joinDate: "2019-09-19T21:06:29.158Z",
		# 				custom: {
		# 					location: "Miami",
		# 					graduationDate: "2018-07-04T21:06:29.158Z",
		# 					isMarried: false,
		# 				},
		# 			},
		# 		})
		# 		expect(res).to eq(true)
		# 	end
		# end
		RSpec.describe Gameball::Transaction do
			it "Makes a simple reward" do
		 				
		 		transactionId = rand 50000..10000000
				res = Gameball::Transaction.reward_points({
					playerUniqueId: "player123",
					amount: 100,
										transactionId: transactionId,
									})
				expect(res).to eq(true)
			end
			it "Makes a reward with player attributes" do
		 				
		 		transactionId = rand 50000..10000000
				res = Gameball::Transaction.reward_points({
					playerUniqueId: "player123",
					amount: 100,
										transactionId: transactionId,
					playerAttributes: {
						displayName: " Jon Snow",
						email: "jon.snow@example.com",
						dateOfBirth: "1980-09-19T00:00:00.000Z",
						joinDate: "2019-09-19T21:06:29.158Z",
						custom: {
							location: "Miami",
							graduationDate: "2018-07-04T21:06:29.158Z",
							isMarried: false,
						},
					},
									})
				expect(res).to eq(true)
			end
			it "Holds points" do
		 				
		 				res = Gameball::Transaction.hold_points({
					playerUniqueId: "player123",
					amount: 2
				})
				expect(res.code).to eq("200")
			end
			it "Redeems points" do
		 				
		 				res = Gameball::Transaction.hold_points({
					playerUniqueId: "player123",
					amount: 2
				})
								holdReference = JSON.parse(res.body)["holdReference"]
				transactionId = rand 50000..10000000
				res = Gameball::Transaction.redeem_points({
					holdReference: holdReference,
					playerUniqueId: "player123",
					transactionId: transactionId
				})
				expect(res.code).to eq("200")
			end
			it "Reverses a transaction" do
		 				
		 				res = Gameball::Transaction.hold_points({
					playerUniqueId: "player123",
					amount: 2
				})
				transactionId = rand 50000..10000000
								holdReference = JSON.parse(res.body)["holdReference"]
				res = Gameball::Transaction.redeem_points({
					holdReference: holdReference,
					playerUniqueId: "player123",
					transactionId: transactionId
				})
				res = Gameball::Transaction.reverse_transaction({
					playerUniqueId: "player123",
					transactionId: transactionId,
					reversedTransactionId: transactionId
				})
				expect(res.code).to eq("200")
			end
			it "Reverses a hold" do
		 				
		 				res = Gameball::Transaction.hold_points({
					playerUniqueId: "player123",
				amount: 2      })
								holdReference = JSON.parse(res.body)["holdReference"]
				res = Gameball::Transaction.reverse_hold({
					playerUniqueId: "player123",
				holdReference: holdReference      })
				expect(res.code).to eq("200")
			end
			it "Gets a Player's balance" do
		 				
		 				res = Gameball::Transaction.get_player_balance("player123")
				expect(res.code).to eq("200")
			end
		end
		RSpec.describe Gameball::Action do
			it "Sends an action with only an event" do
				res= Gameball::Action.send_action({ 
					playerUniqueId: "uniquekeys120",
					events:{
						review:{},
						reserve:{rooms:2}
											}
				}) 
				expect(res.code).to eq("200")
			end
			it "Sends an action with only event and reward" do
				transactionId = rand 50000..10000000
				res= Gameball::Action.send_action({
					playerUniqueId: "player123",
					events:{
						review:{},
						reserve:{
							rooms:2
						}
											},
					pointsTransaction:{
						rewardAmount:2,
						transactionId:transactionId
					}
				}
			)  
			expect(res.code).to eq("200")
		end
	end
		
