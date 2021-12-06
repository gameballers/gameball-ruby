module Gameball
    class Order
      def self.place_order(body)
        # Validating keys in incoming body
        Gameball::Utils.validate(body, ["playerUniqueId","orderId","totalPaid","totalPrice"], 
            ["mobile","email","totalShipping","totalTax","totalDiscount","lineItems","discountCodes","extra","redeemedAmount","holdReference","guest",
                "merchant"])
        body[:orderDate] = Time.now.utc.iso8601
        res = Gameball::Utils::request("post", "/Integrations/order", body)
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
    end
  end
  