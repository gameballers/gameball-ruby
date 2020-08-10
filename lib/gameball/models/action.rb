module Gameball
  class Action
    def send_action(body)
      Gameball::Utils.validate(body, ["playerUniqueId"], ["playerAttributes", "events", "pointsTransaction"])
      res = Gameball::Utils::request("post", "/Integrations/Action", body)
      unless res.kind_of? Net::HTTPSuccess
        if res.kind_of? Net::HTTPInternalServerError
          raise Gameball::GameballError.new("An Internal Server Error has occurred")
        else
          raise Gameball::GameballError.new(res.body) # use custom message
        end
      else
        return res
      end
    end
  end
end
