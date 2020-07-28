module Gameball
     module Request
            def Request.getBot(body={})
                Gameball::Utils::request("get","/bots/BotSettings")
            end
    end
end
