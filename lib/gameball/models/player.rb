module Gameball
  class Player
    # include Gameball::Request
    def self.initialize_player(customerBody)
      Gameball::Utils.validate(customerBody, ["playerAttributes", "playerUniqueId"], [])
      begin
        customerBody[:playerAttributes][:joinDate] = customerBody[:playerAttributes][:joinDate].iso8601
        customerBody[:playerAttributes][:dateOfBirth] = customerBody[:playerAttributes][:dateOfBirth].iso8601
      rescue NoMethodError => exception
        # p exception
        raise Gameball::GameballError.new("Invalid Date Format, Please use Time and Date objects")
      end

      res = Gameball::Utils::request("post", "/integrations/player", customerBody)
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
    def self.get_player_info(playerUniqueId)
      body = { playerUniqueId: playerUniqueId }
      body["hash"] = Gameball::Utils::hashBody(playerUniqueId: playerUniqueId)
      res = Gameball::Utils::request("post", "/integrations/Player/Info", body)
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
