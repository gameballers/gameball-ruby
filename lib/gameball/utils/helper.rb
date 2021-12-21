module Gameball
  module Utils
    extend self

    def hashBody(playerUniqueId:, transactionTime: "", amount: "") # Helper method that hashes the attributes that are sent using SHA1 algorithm
      # Check if transaction Key is provided else raise Error
      if !Gameball.transaction_key
        raise Gameball::GameballError.new("Please provide transaction_key, try Gameball::transaction_key='your_key'") # Raise exception
      else
        if transactionTime == ""
          formatted_time = ""
        else
          formatted_time = transactionTime.strftime("%y%m%d%H%M%S")
        end
      end

      str = playerUniqueId + ":" + formatted_time + ":" + amount.to_s + ":" + Gameball.transaction_key
      return Digest::SHA1.hexdigest (str)
    end

    def extractAttributesToHash(body) # Helper method that extracts the attributes from the body and pass it to hashing function
      playerUniqueId = body[:playerUniqueId]
      amount = body[:amount]
      transactionTime = body[:transactionTime]
      begin
        body[:transactionTime] = transactionTime.iso8601
      rescue NoMethodError => exception
        raise Gameball::GameballError.new("Invalid Date Formate, Please use Date and Time objects")
      end

      body["hash"] = Gameball::Utils::hashBody(playerUniqueId: playerUniqueId, amount: (amount || ""), transactionTime: (transactionTime || ""))
      body
    end
    def hash_to_query(hash)
      return URI.encode_www_form(hash)
    end
  end
end
