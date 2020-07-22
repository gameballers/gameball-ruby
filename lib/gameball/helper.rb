module Gameball
    module Helper
        extend self
        def hashBody(playerUniqueId:,transactionTime:"",amount:"")
            # Check if transaction Key is provided else raise Exc
            if transactionTime==""
                formatted_time=""
            else
                formatted_time=transactionTime.strftime("%y%m%d%H%M%S")
            end
            str=playerUniqueId+":"+formatted_time+":"+amount+":"+Gameball.transaction_key
            puts str
            Digest::SHA1.hexdigest (str)
        end

    end
end