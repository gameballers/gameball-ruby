module Gameball
  class Transaction
    # include Gameball::Utils
    def self.get_player_balance(playerId)
      hashedBody = Gameball::Utils::hashBody(playerUniqueId: playerId)
      body = { playerUniqueId: playerId,
               hash: hashedBody }
      res = Gameball::Utils::request("post", "/integrations/transaction/balance", body)
      unless res.kind_of? Net::HTTPSuccess
        raise Gameball::GameballError.new(res.body) 
      else
        return res
      end
    end
    def self.hold_points(body)
      # puts body
      # check if attributes are available
      if (Gameball.api_version!="v3.0")
        Gameball::Utils.validate(body, ["playerUniqueId", "amount"], ["otp"])
        body[:transactionTime] = Time.now.utc
        body = Gameball::Utils::extractAttributesToHash(body)
      else
        Gameball::Utils.validate(body, ["playerUniqueId", "amount"], ["mobile","email"])
        body[:transactionTime] = Time.now.utc.iso8601
      end
      res = Gameball::Utils::request("post", "/integrations/transaction/hold", body)
      unless res.kind_of? Net::HTTPSuccess
        if res.kind_of? Net::HTTPInternalServerError
          raise Gameball::GameballError.new("An Internal Server Error has occurred")
        else
          raise Gameball::GameballError.new(res.body) 
        end
      else
        return res
      end
    end
    def self.redeem_points(body)
      # check if attributes are available
      if (Gameball.api_version!="v3.0")
        Gameball::Utils.validate(body, ["holdReference", "playerUniqueId", "transactionId"], [])
        body[:transactionTime] = Time.now.utc
        body = Gameball::Utils::extractAttributesToHash(body)
      else
        Gameball::Utils.validate(body, ["playerUniqueId", "transactionId"],
          ["mobile","email","redeemedAmount","holdReference"])
        body[:transactionTime] = Time.now.utc.iso8601
      end
      res = Gameball::Utils::request("post", "/integrations/transaction/redeem", body)
      unless res.kind_of? Net::HTTPSuccess
        if res.kind_of? Net::HTTPInternalServerError
          raise Gameball::GameballError.new("An Internal Server Error has occurred")
        else
          raise Gameball::GameballError.new(res.body) 
        end
      else
        return res
      end
    end
    def self.reverse_transaction(body)
      Gameball::Utils.validate(body, ["reversedTransactionId", "playerUniqueId", "transactionId"], [])
      body[:transactionTime] = Time.now.utc
      body = Gameball::Utils::extractAttributesToHash(body)
      res = Gameball::Utils::request("post", "/integrations/transaction/cancel", body)
      unless res.kind_of? Net::HTTPSuccess
        if res.kind_of? Net::HTTPInternalServerError
          raise Gameball::GameballError.new("An Internal Server Error has occurred")
        else
          raise Gameball::GameballError.new(res.body) 
        end
      else
        return res
      end
    end
    def self.refund(body)
      Gameball::Utils.validate(body, ["reverseTransactionId", "playerUniqueId", "transactionId"],
         ["mobile","email","amount"])
      body[:transactionTime] = Time.now.utc.iso8601
      res = Gameball::Utils::request("post", "/integrations/transaction/refund", body)
      unless res.kind_of? Net::HTTPSuccess
        if res.kind_of? Net::HTTPInternalServerError
          raise Gameball::GameballError.new("An Internal Server Error has occurred")
        else
          raise Gameball::GameballError.new(res.body) 
        end
      else
        return res
      end
    end
    def self.reward_points(body)
      Gameball::Utils.validate(body, ["playerUniqueId", "amount", "transactionId"], ["playerAttributes"])
      body[:transactionTime] = Time.now.utc
      body = Gameball::Utils::extractAttributesToHash(body)
      res = Gameball::Utils::request("post", "/integrations/transaction/reward", body)
      unless res.kind_of? Net::HTTPSuccess
        if res.kind_of? Net::HTTPInternalServerError
          raise Gameball::GameballError.new("An Internal Server Error has occurred")
        else
          raise Gameball::GameballError.new(res.body) 
        end
      else
        return res
      end
    end
    def self.cashback(body)
      Gameball::Utils.validate(body, ["playerUniqueId", "amount", "transactionId"], ["mobile","email","merchant"])
      body[:transactionTime] = Time.now.utc.iso8601
      res = Gameball::Utils::request("post", "/integrations/transaction/cashback", body)
      unless res.kind_of? Net::HTTPSuccess
        if res.kind_of? Net::HTTPInternalServerError
          raise Gameball::GameballError.new("An Internal Server Error has occurred")
        else
          raise Gameball::GameballError.new(res.body) 
        end
      else
        return res
      end
    end
    def self.manual_transaction(body)
      Gameball::Utils.validate(body, ["playerUniqueId", "username", "transactionId","reason"],
         ["mobile","email","amount","points"])
      body[:transactionTime] = Time.now.utc.iso8601
      res = Gameball::Utils::request("post", "/integrations/transaction/manual", body)
      unless res.kind_of? Net::HTTPSuccess
        if res.kind_of? Net::HTTPInternalServerError
          raise Gameball::GameballError.new("An Internal Server Error has occurred")
        else
          raise Gameball::GameballError.new(res.body) 
        end
      else
        return res
      end
    end
    def self.list_transaction(params={})
      Gameball::Utils.validate(params, [], ["page","limit","direction","from","to","transactionId","status"])
      res = Gameball::Utils::request("get", "/integrations/transaction/list",params:params)
      unless res.kind_of? Net::HTTPSuccess
        if res.kind_of? Net::HTTPInternalServerError
          raise Gameball::GameballError.new("An Internal Server Error has occurred")
        else
          raise Gameball::GameballError.new(res.body) 
        end
      else
        return res
      end
    end
    def self.reverse_hold(body)
      # check if holdReference is in body else throw error
      if(Gameball.api_version=="v3.0")
        # If v3.0 holReference is sent instead of body in args
        res = Gameball::Utils::request("delete", "/integrations/transaction/hold/#{body}")
        unless res.kind_of? Net::HTTPSuccess
          if res.kind_of? Net::HTTPInternalServerError
            raise Gameball::GameballError.new("An Internal Server Error has occurred")
          else
            raise Gameball::GameballError.new(res.body) 
          end
        else
          return res
        end
      end
      Gameball::Utils.validate(body, ["holdReference", "playerUniqueId"], [])
      body[:transactionTime] = Time.now.utc
      body = Gameball::Utils::extractAttributesToHash(body)
      res = Gameball::Utils::request("post", "/integrations/transaction/hold", body)
      unless res.kind_of? Net::HTTPSuccess
        if res.kind_of? Net::HTTPInternalServerError
          raise Gameball::GameballError.new("An Internal Server Error has occurred")
        else
          raise Gameball::GameballError.new(res.body) 
        end
      else
        return res
      end
    end
  end
end
