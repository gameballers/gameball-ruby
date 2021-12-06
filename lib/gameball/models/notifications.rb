module Gameball
    class Notifications
      # include Gameball::Utils
      def self.get_notifications(playerUniqueId,params={})
        Gameball::Utils.validate(params, [], ["limit","page","isRead","lang"])
        res = Gameball::Utils::request("get", "/integrations/notifications/#{playerUniqueId}",params:params)
        unless res.kind_of? Net::HTTPSuccess
          if res.kind_of? Net::HTTPInternalServerError
            raise Gameball::GameballError.new("An Internal Server Error has occurred")
          else
            raise Gameball::GameballError.new(res.body) 
          end
        else
          return res
        end
      end
      def self.mark_notifications(body)
        Gameball::Utils.validate(body, ["notificationIds"], [])
        res = Gameball::Utils::request("put", "/integrations/notifications",body)
        unless res.kind_of? Net::HTTPSuccess
          if res.kind_of? Net::HTTPInternalServerError
            raise Gameball::GameballError.new("An Internal Server Error has occurred")
          else
            raise Gameball::GameballError.new(res.body) 
          end
        else
          return res
        end
      end
    end
  end
  