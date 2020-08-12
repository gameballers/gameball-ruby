module Gameball
  class Event
    # include Gameball::Request
    def self.sendEvent(eventBody)
      Gameball::Utils.validate(eventBody, ["events", "playerUniqueId"], ["playerAttributes"])
      if eventBody.has_key?(:playerAttributes)
        # Gameball::Utils.validate(eventBody[:playerAttributes],['displayName','firstName','lastName','email','gender','mobileNumber','dateOfBirth','joinDate'],['custom'])
      end
      res = Gameball::Utils::request("post", "/integrations/event", eventBody)
      unless res.kind_of? Net::HTTPSuccess
        if res.kind_of? Net::HTTPInternalServerError
          raise Gameball::GameballError.new("An Internal Server Error has occurred")
        else
          raise Gameball::GameballError.new(res.body) # use custom message
        end
      else
        return true
      end
    end
    def self.sendEvent_async(eventBody)
      Gameball::Utils.validate(eventBody, ["events", "playerUniqueId"], ["playerAttributes"])
      if eventBody.has_key?(:playerAttributes)
        # Gameball::Utils.validate(eventBody[:playerAttributes],['displayName','firstName','lastName','email','gender','mobileNumber','dateOfBirth','joinDate'],['custom'])
      end
      res = Gameball::Utils::request_async("post", "/integrations/event", eventBody)
      unless res.kind_of? Net::HTTPSuccess
        if res.kind_of? Net::HTTPInternalServerError
          raise Gameball::GameballError.new("An Internal Server Error has occurred")
        else
          raise Gameball::GameballError.new(res.body) # use custom message
        end
      else
        return true
      end
    end
  end
end
