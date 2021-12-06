module Gameball
    class Leaderboard
      # include Gameball::Utils
      def self.get_leaderboard(params={})
        Gameball::Utils.validate(params, [], ["limit","from","to","playerUniqueId","challengeId"])
        res = Gameball::Utils::request("get", "/integrations/leaderboard",params:params)
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
  