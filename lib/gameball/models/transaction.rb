module Gameball
    class Transaction
        # include Gameball::Utils
        def self.get_player_balance (playerId)
            hashedBody=Gameball::Utils::hashBody(playerUniqueId:playerId)
            body={playerUniqueId:playerId,
                bodyHashed:hashedBody
            }
            res=Gameball::Utils::request("post","/integrations/transaction/balance",body)
            unless res.kind_of? Net::HTTPSuccess
                raise Gameball::GameballException.new(res.body) # use custom message
            else 
                return res
            end
        end
        def self.hold_points(body) 
            puts body
            # check if attributes are available
            Gameball::Utils.validate(body,['playerUniqueId','amount','transactionTime'],['otp'])

            body=Gameball::Utils::extractAttributesToHash(body)
            res=Gameball::Utils::request("post","/integrations/transaction/hold",body)
            unless res.kind_of? Net::HTTPSuccess
                raise Gameball::GameballException.new(res.body) # use custom message
            else 
                return res
            end
        end
        def self.redeem_points(body) 
            # check if attributes are available
            Gameball::Utils.validate(body,['holdReference','playerUniqueId','amount','transactionOnClientSystemId','transactionTime'],[])
            body=Gameball::Utils::extractAttributesToHash(body)
            res=Gameball::Utils::request("post","/integrations/transaction/redeem",body)
            unless res.kind_of? Net::HTTPSuccess
                raise Gameball::GameballException.new(res.body) # use custom message
            else 
                return res
            end
        end
        def self.reverse_transaction(body)
            Gameball::Utils.validate(body,['reversedTransactionOnClientSystemId','playerUniqueId','transactionOnClientSystemId','transactionTime'],[])
            body=Gameball::Utils::extractAttributesToHash(body)
            res=Gameball::Utils::request("post","/integrations/transaction/cancel",body)
            unless res.kind_of? Net::HTTPSuccess
                raise Gameball::GameballException.new(res.body) # use custom message
            else 
                return res
            end
        end
         def self.reward_points(body)
            Gameball::Utils.validate(body,['playerUniqueId','amount','transactionOnClientSystemId','transactionTime'],['playerAttributes'])
            if body.has_key?(:playerAttributes)
            Gameball::Utils.validate(body[:playerAttributes],['displayName','firstName','lastName','email','gender','mobileNumber','dateOfBirth','joinDate'],['custom'])
            end
            body=Gameball::Utils::extractAttributesToHash(body)
            res=Gameball::Utils::request("post","/integrations/transaction/reward",body)
            unless res.kind_of? Net::HTTPSuccess
                raise Gameball::GameballException.new(res.body) # use custom message
            else 
                return true
            end
        end
        def self.reverse_hold(body)
            # check if holdReference is in body else throw error
            Gameball::Utils.validate(body,['holdReference','playerUniqueId','transactionTime'],[])

            body=Gameball::Utils::extractAttributesToHash(body)
            res=Gameball::Utils::request("post","/integrations/transaction/hold",body)
            unless res.kind_of? Net::HTTPSuccess
                raise Gameball::GameballException.new(res.body) # use custom message
            else 
                return res
            end
        end
    end
end