module Gameball
    module Helper
        extend self
        def hashBody(playerUniqueId:,transactionTime:"",amount:"")
            # Check if transaction Key is provided else raise Exc
            if !Gameball.transaction_key
            puts "Please add the transaction key" # Raise exception 
            else
                if transactionTime=="" 
                    formatted_time=""
                else
                    formatted_time=transactionTime.strftime("%y%m%d%H%M%S")
                end
            end
            str=playerUniqueId+":"+formatted_time+":"+amount.to_s+":"+Gameball.transaction_key
            puts str
            return Digest::SHA1.hexdigest (str)
        end
        def extractAttributesToHash(body)
            # check if hashing attributes are in body to prevent errors then raise exceptions
            playerUniqueId=body[:playerUniqueId]
            amount=body[:amount]
            transactionTime=body[:transactionTime]
            body[:transactionTime]=transactionTime.iso8601
            body["bodyHashed"]=Gameball::Helper::hashBody(playerUniqueId:playerUniqueId,amount:amount,transactionTime:transactionTime)
            body
        end
        

    end
end