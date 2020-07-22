module Gameball
    class Player
        # include Gameball::Request
        def self.create (customerBody)
            Gameball::Request::request("post","/bots/BotSettings",customerBody)
        end
    end
end