module Gameball
    class Referral
        def self.create_referral(body)
            Gameball::Utils.validate(body,['playerUniqueId','playerCode'],['playerAttributes'])
            if body.has_key?(:playerAttributes)
            # Gameball::Utils.validate(body[:playerAttributes],['displayName','firstName','lastName','email','gender','mobileNumber','dateOfBirth','joinDate'],['custom'])
            end
            res=Gameball::Utils::request("post","/integrations/referral",body)
            unless res.kind_of? Net::HTTPSuccess
                raise Gameball::GameballError.new(res.body) # use custom message
            else 
                return true
            end
        end
        def self.create_referral_async(body)
            Gameball::Utils.validate(body,['playerUniqueId','playerCode'],['playerAttributes'])
            if body.has_key?(:playerAttributes)
            # Gameball::Utils.validate(body[:playerAttributes],['displayName','firstName','lastName','email','gender','mobileNumber','dateOfBirth','joinDate'],['custom'])
            end
            Gameball::Utils::request_async("post","/integrations/referral",body)
        end
    end
end