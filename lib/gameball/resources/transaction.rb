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
            Gameball::Validations.validate(body,['playerUniqueId','amount','transactionTime'],['otp'])

            body=Gameball::Helper::extractAttributesToHash(body)
            Gameball::Request::request("post","/integrations/transaction/hold",body)
        end
        def self.redeem(body) 
            # check if attributes are available
            Gameball::Validations.validate(body,['holdReference','playerUniqueId','amount','transactionOnClientSystemId','transactionTime'],[])
            body=Gameball::Helper::extractAttributesToHash(body)
            Gameball::Request::request("post","/integrations/transaction/redeem",body)
        end
        def self.cancel(body)
            Gameball::Validations.validate(body,['reversedTransactionOnClientSystemId','playerUniqueId','transactionOnClientSystemId','transactionTime'],[])

            body=Gameball::Helper::extractAttributesToHash(body)
            Gameball::Request::request("post","/integrations/transaction/cancel",body)
        end
         def self.reward(body)
            Gameball::Validations.validate(body,['playerUniqueId','amount','transactionOnClientSystemId','transactionTime'],['playerAttributes'])
            if body.has_key?(:playerAttributes)
            Gameball::Validations.validate(body[:playerAttributes],['displayName','firstName','lastName','email','gender','mobileNumber','dateOfBirth','joinDate'],['custom'])
            end
            body=Gameball::Helper::extractAttributesToHash(body)
            Gameball::Request::request("post","/integrations/transaction/reward",body)
        end
        def self.reverseHold(body)
            # check if holdReference is in body else throw error
            Gameball::Validations.validate(body,['holdReference','playerUniqueId','transactionTime'],[])

            body=Gameball::Helper::extractAttributesToHash(body)
            Gameball::Request::request("post","/integrations/transaction/reward",body)
        end
    end
end