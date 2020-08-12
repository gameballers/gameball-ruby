module Gameball
  class Coupon
    def self.create_discount_coupon(body)
<<<<<<< HEAD
      Gameball::Utils.validate(body, ["playerUniqueId", "transactionTime"], ["startAt", "endsAt", "entitledCollectionIds", "entitledProductIds",
                                                                             "oncePerCustomer", "prerequisiteQuantityRange", "prerequisiteShippingPriceRange", "prerequisiteSubtotalRange",
                                                                             "prerequisiteCollectionIds", "prerequisiteProductIds", "code", "usageLimit", "value", "valueType", "cap"])
=======
      Gameball::Utils.validate(body, ["playerUniqueId"], ["startAt", "endsAt", "entitledCollectionIds", "entitledProductIds",
                                                          "oncePerCustomer", "prerequisiteQuantityRange", "prerequisiteShippingPriceRange", "prerequisiteSubtotalRange",
                                                          "prerequisiteCollectionIds", "prerequisiteProductIds", "code", "usageLimit", "value", "valueType", "cap"])

      body[:transactionTime] = Time.now.utc
>>>>>>> aece124df52cb5113b88b74b8e8eb5c68bec89ef
      body["hash"] = Gameball::Utils::hashBody(playerUniqueId: body[:playerUniqueId])
      res = Gameball::Utils::request("post", "/Integrations/Coupon", body)
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
    def self.validate_discount_coupon(body)
<<<<<<< HEAD
      Gameball::Utils.validate(body, ["playerUniqueId", "code", "transactionTime"])
=======
      Gameball::Utils.validate(body, ["playerUniqueId", "code"])
      body[:transactionTime] = Time.now.utc

>>>>>>> aece124df52cb5113b88b74b8e8eb5c68bec89ef
      body["hash"] = Gameball::Utils::hashBody(playerUniqueId: body[:playerUniqueId])
      res = Gameball::Utils::request("post", "/Integrations/Coupon/Validate", body)
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
    def self.redeem_discount_coupon(body)
<<<<<<< HEAD
      Gameball::Utils.validate(body, ["playerUniqueId", "code", "transactionTime"])
=======
      Gameball::Utils.validate(body, ["playerUniqueId", "code"])
      body[:transactionTime] = Time.now.utc
>>>>>>> aece124df52cb5113b88b74b8e8eb5c68bec89ef
      body["hash"] = Gameball::Utils::hashBody(playerUniqueId: body[:playerUniqueId])
      res = Gameball::Utils::request("post", "/Integrations/Coupon/Redeem", body)
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
  end
end
