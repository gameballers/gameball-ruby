module Gameball
  class Coupon
    def self.create_discount_coupon(body) 
      # Validating keys in incoming body
      Gameball::Utils.validate(body, ["playerUniqueId"], ["startAt", "endsAt", "entitledCollectionIds", "entitledProductIds",
                                                          "oncePerCustomer", "prerequisiteQuantityRange", "prerequisiteShippingPriceRange", "prerequisiteSubtotalRange",
                                                          "prerequisiteCollectionIds", "prerequisiteProductIds", "code", "usageLimit", "value", "valueType", "cap"])

      body[:transactionTime] = Time.now.utc
      body["hash"] = Gameball::Utils::hashBody(playerUniqueId: body[:playerUniqueId])
      res = Gameball::Utils::request("post", "/Integrations/Coupon", body)
      # Check for HTTP Success and throws error if not success
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
    def self.validate_discount_coupon(body)
      # Validating keys in incoming body
      Gameball::Utils.validate(body, ["playerUniqueId", "code"])
      body[:transactionTime] = Time.now.utc
      body["hash"] = Gameball::Utils::hashBody(playerUniqueId: body[:playerUniqueId])
      res = Gameball::Utils::request("post", "/Integrations/Coupon/Validate", body)
      # Check for HTTP Success and throws error if not success
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
    def self.redeem_discount_coupon(body)
      # Check for HTTP Success and throws error if not success
      Gameball::Utils.validate(body, ["playerUniqueId", "code"])
      body[:transactionTime] = Time.now.utc
      body["hash"] = Gameball::Utils::hashBody(playerUniqueId: body[:playerUniqueId])
      res = Gameball::Utils::request("post", "/Integrations/Coupon/Redeem", body)
      # Check for HTTP Success and throws error if not success
      unless res.kind_of? Net::HTTPSuccess
        if res.kind_of? Net::HTTPInternalServerError
          raise Gameball::GameballError.new("An Internal Server Error has occurred")
        else
          raise Gameball::GameballError.new(res.body) 
        end
      else
        return true
      end
    end
  end
end
