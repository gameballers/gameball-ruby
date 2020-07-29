module Gameball
    class Referral
        def self.create_referral(body)
            Gameball::Utils.validate(body,['playerUniqueId','playerCode'],['playerAttributes'])
            if body.has_key?(:playerAttributes)
            Gameball::Utils.validate(body[:playerAttributes],['displayName','firstName','lastName','email','gender','mobileNumber','dateOfBirth','joinDate'],['custom'])
            end
            Gameball::Utils::request("post","/integrations/referral",body)
        end
        def self.create_referral_async(body)
            Gameball::Utils.validate(body,['playerUniqueId','playerCode'],['playerAttributes'])
            if body.has_key?(:playerAttributes)
            Gameball::Utils.validate(body[:playerAttributes],['displayName','firstName','lastName','email','gender','mobileNumber','dateOfBirth','joinDate'],['custom'])
            end
            Gameball::Utils::request_async("post","/integrations/referral",body)
        end
    end
end