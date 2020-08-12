module Gameball
  class Transaction
    # include Gameball::Utils
    def self.get_player_balance(playerId)
      hashedBody = Gameball::Utils::hashBody(playerUniqueId: playerId)
      body = { playerUniqueId: playerId,
<<<<<<< HEAD
               bodyHashed: hashedBody }
=======
               hash: hashedBody }
>>>>>>> aece124df52cb5113b88b74b8e8eb5c68bec89ef
      res = Gameball::Utils::request("post", "/integrations/transaction/balance", body)
      unless res.kind_of? Net::HTTPSuccess
        raise Gameball::GameballError.new(res.body) # use custom message
      else
        return res
      end
    end
    def self.hold_points(body)
      # puts body
      # check if attributes are available
<<<<<<< HEAD
      Gameball::Utils.validate(body, ["playerUniqueId", "amount", "transactionTime"], ["otp"])

=======

      Gameball::Utils.validate(body, ["playerUniqueId", "amount"], ["otp"])
      body[:transactionTime] = Time.now.utc
>>>>>>> aece124df52cb5113b88b74b8e8eb5c68bec89ef
      body = Gameball::Utils::extractAttributesToHash(body)
      res = Gameball::Utils::request("post", "/integrations/transaction/hold", body)
      unless res.kind_of? Net::HTTPSuccess
        if res.kind_of? Net::HTTPInternalServerError
          raise Gameball::GameballError.new("An Internal Server Error has occurred")
        else
          raise Gameball::GameballError.new(res.body) # use custom message
        end
      else
        return res
      end
    end
    def self.redeem_points(body)
      # check if attributes are available
<<<<<<< HEAD
      Gameball::Utils.validate(body, ["holdReference", "playerUniqueId", "amount", "transactionOnClientSystemId", "transactionTime"], [])
=======
      Gameball::Utils.validate(body, ["holdReference", "playerUniqueId", "transactionId"], [])
      body[:transactionTime] = Time.now.utc
>>>>>>> aece124df52cb5113b88b74b8e8eb5c68bec89ef
      body = Gameball::Utils::extractAttributesToHash(body)
      res = Gameball::Utils::request("post", "/integrations/transaction/redeem", body)
      unless res.kind_of? Net::HTTPSuccess
        if res.kind_of? Net::HTTPInternalServerError
          raise Gameball::GameballError.new("An Internal Server Error has occurred")
        else
          raise Gameball::GameballError.new(res.body) # use custom message
        end
      else
        return res
      end
    end
    def self.reverse_transaction(body)
<<<<<<< HEAD
      Gameball::Utils.validate(body, ["reversedTransactionOnClientSystemId", "playerUniqueId", "transactionOnClientSystemId", "transactionTime"], [])
=======
      Gameball::Utils.validate(body, ["reversedTransactionId", "playerUniqueId", "transactionId"], [])
      body[:transactionTime] = Time.now.utc

>>>>>>> aece124df52cb5113b88b74b8e8eb5c68bec89ef
      body = Gameball::Utils::extractAttributesToHash(body)
      res = Gameball::Utils::request("post", "/integrations/transaction/cancel", body)
      unless res.kind_of? Net::HTTPSuccess
        if res.kind_of? Net::HTTPInternalServerError
          raise Gameball::GameballError.new("An Internal Server Error has occurred")
        else
          raise Gameball::GameballError.new(res.body) # use custom message
        end
      else
        return res
      end
    end
    def self.reward_points(body)
<<<<<<< HEAD
      Gameball::Utils.validate(body, ["playerUniqueId", "amount", "transactionOnClientSystemId", "transactionTime"], ["playerAttributes"])
=======
      Gameball::Utils.validate(body, ["playerUniqueId", "amount", "transactionId"], ["playerAttributes"])
      body[:transactionTime] = Time.now.utc

>>>>>>> aece124df52cb5113b88b74b8e8eb5c68bec89ef
      body = Gameball::Utils::extractAttributesToHash(body)
      res = Gameball::Utils::request("post", "/integrations/transaction/reward", body)
      unless res.kind_of? Net::HTTPSuccess
        if res.kind_of? Net::HTTPInternalServerError
          raise Gameball::GameballError.new("An Internal Server Error has occurred")
        else
          raise Gameball::GameballError.new(res.body) # use custom message
        end
      else
        return true
      end
    end
    def self.reverse_hold(body)
      # check if holdReference is in body else throw error
<<<<<<< HEAD
      Gameball::Utils.validate(body, ["holdReference", "playerUniqueId", "transactionTime"], [])
=======
      Gameball::Utils.validate(body, ["holdReference", "playerUniqueId"], [])
      body[:transactionTime] = Time.now.utc
>>>>>>> aece124df52cb5113b88b74b8e8eb5c68bec89ef

      body = Gameball::Utils::extractAttributesToHash(body)
      res = Gameball::Utils::request("post", "/integrations/transaction/hold", body)
      unless res.kind_of? Net::HTTPSuccess
        if res.kind_of? Net::HTTPInternalServerError
          raise Gameball::GameballError.new("An Internal Server Error has occurred")
        else
          raise Gameball::GameballError.new(res.body) # use custom message
        end
      else
        return res
      end
    end
  end
end
