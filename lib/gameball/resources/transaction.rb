module Gameball
    class Transaction
        # include Gameball::Request
        def self.balance (playerId)
            hashedBody=Gameball::Helper::hashBody(playerUniqueId:playerId)
            body={playerUniqueId:playerId,
                bodyHashed:hashedBody
            }
            Gameball::Request::request("post","/integrations/transaction/balance",body)
        end
        def self.hold(body) 
            puts body
            # check if attributes are available
            body=Gameball::Helper::extractAttributesToHash(body)
            Gameball::Request::request("post","/integrations/transaction/hold",body)
        end
        def self.redeem(body) 
            # check if attributes are available
            body=Gameball::Helper::extractAttributesToHash(body)
            Gameball::Request::request("post","/integrations/transaction/redeem",body)
        end
        def self.reward(body)
            body=Gameball::Helper::extractAttributesToHash(body)
            Gameball::Request::request("post","/integrations/transaction/reward",body)
        end
        def self.reverseHold(body)
            # check if holdReference is in body else throw error
            body=Gameball::Helper::extractAttributesToHash(body)
            Gameball::Request::request("post","/integrations/transaction/reward",body)
        end
    end
end