module Gameball
    class Event
        # include Gameball::Request
        def self.sendEvent (eventBody)
            Gameball::Validations.validate(eventBody,['events','playerUniqueId'],['playerAttributes'])
            Gameball::Request::request("post","/integrations/event",eventBody)
        end
    end
end