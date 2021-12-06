module Gameball
    class Configurations
      # include Gameball::Utils
      def self.get_configurations(params={})
        Gameball::Utils.validate(params, [], ["lang"])
        res = Gameball::Utils::request("get", "/integrations/config",params:params)
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
  