module Gameball
    class Referral
        def self.refer(body)
            Gameball::Request::request("post","/integrations/referral",body)
        end
    end
end