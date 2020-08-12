module Gameball
  class Event
    def self.sendEvent(eventBody)
      # Validating keys in incoming body
      Gameball::Utils.validate(eventBody, ["events", "playerUniqueId"], ["playerAttributes"])
      res = Gameball::Utils::request("post", "/integrations/event", eventBody)
      # Check for HTTP Success and throws error if not success
      unless res.kind_of? Net::HTTPSuccess
        if res.kind_of? Net::HTTPInternalServerError
          raise Gameball::GameballError.new("An Internal Server Error has occurred")
        else
          raise Gameball::GameballError.new(res.body) 
        end
      else
        return true
      end
    end
    def self.sendEvent_async(eventBody)
      # Validating keys in incoming body
      Gameball::Utils.validate(eventBody, ["events", "playerUniqueId"], ["playerAttributes"])
      res = Gameball::Utils::request_async("post", "/integrations/event", eventBody)
      # Check for HTTP Success and throws error if not success
      unless res.kind_of? Net::HTTPSuccess
        if res.kind_of? Net::HTTPInternalServerError
          raise Gameball::GameballError.new("An Internal Server Error has occurred")
        else
          raise Gameball::GameballError.new(res.body) 
        end
      else
        return true
      end
    end
  end
end
