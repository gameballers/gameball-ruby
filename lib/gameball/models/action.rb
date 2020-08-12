module Gameball
  class Action
    def self.send_action(body)
      Gameball::Utils.validate(body, ["playerUniqueId"], ["playerAttributes", "events", "pointsTransaction"])
      if body.has_key? (:pointsTransaction)
        Gameball::Utils.validate(body[:pointsTransaction], ['transactionId'],['rewardAmount','holdReference'])
        body[:pointsTransaction][:transactionTime]=Time.now.utc
        amount=''
        if body[:pointsTransaction].has_key?(:rewardAmount)
          amount=body[:pointsTransaction][:rewardAmount]
        end
        body[:pointsTransaction]['hash']=Gameball::Utils.hashBody(playerUniqueId:body[:playerUniqueId],transactionTime:body[:pointsTransaction][:transactionTime],amount:amount)
      end
      body[:pointsTransaction][:transactionTime]=Time.now.utc.iso8601

      p body.to_json
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
