module Gameball
     module Request
        module GetBot
            extend self
            def getBot(body={})
                Request::request("get","/bots/BotSettings")
            end
        end
    end
end
