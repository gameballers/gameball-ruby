module Gameball
    class Player
        # include Gameball::Request
        def self.create (customerBody)
            customerBody[:joinDate]=customerBody[:joined_date].iso8601
            customerBody[:dateOfBirth]=customerBody[:dateOfBirth].iso8601
            Gameball::Request::request("post","/bots/BotSettings",customerBody)
        end
    end
end