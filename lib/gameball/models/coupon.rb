module Gameball
 class Coupon
    def self.create_discount_coupon(body)
        body["hash"]=Gameball::Utils::hashBody(playerUniqueId:body[:playerUniqueId])
        res=Gameball::Utils::request("post","/Integrations/Coupon",body)        
            unless res.kind_of? Net::HTTPSuccess
                raise Gameball::GameballError.new(res) # use custom message
            else 
                return res
            end
    end
    def self.validate_discount_coupon(body)
        body["hash"]=Gameball::Utils::hashBody(playerUniqueId:body[:playerUniqueId])
        res=Gameball::Utils::request("post","/Integrations/Coupon/Validate",body)
        unless res.kind_of? Net::HTTPSuccess
            raise Gameball::GameballError.new(res) # use custom message
        else 
            return res
        end
    end
    def self.redeem_discount_coupon(body)
        body["hash"]=Gameball::Utils::hashBody(playerUniqueId:body[:playerUniqueId])
        res=Gameball::Utils::request("post","/Integrations/Coupon/Redeem",body)
        unless res.kind_of? Net::HTTPSuccess
            raise Gameball::GameballError.new(res) # use custom message
        else 
            return true
        end
    end

 end
end