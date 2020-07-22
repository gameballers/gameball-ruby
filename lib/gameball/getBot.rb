module Gameball
     module Request
            def Request.getBot(body={})
                Gameball::Request::request("get","/bots/BotSettings")
            end
    end
end
