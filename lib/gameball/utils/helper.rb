module Gameball
  module Utils
    extend self

    def hashBody(playerUniqueId:, transactionTime: "", amount: "")
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

    def extractAttributesToHash(body)
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
  end
end
