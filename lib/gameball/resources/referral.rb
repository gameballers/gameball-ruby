module Gameball
    class Referral
        def self.refer(body)
            Gameball::Validations.validate(body,['playerUniqueId','playerCode'],['playerAttributes'])
            if body.has_key?(:playerAttributes)
            Gameball::Validations.validate(body[:playerAttributes],['displayName','firstName','lastName','email','gender','mobileNumber','dateOfBirth','joinDate'],['custom'])
            end
            Gameball::Request::request("post","/integrations/referral",body)
        end
    end
end