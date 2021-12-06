module Gameball
  class Player
    def self.initialize_player(body)
      # Validating keys in incoming body
      Gameball::Utils.validate(body, ["playerAttributes", "playerUniqueId"], ["mobile","email","referrerCode","levelOrder"])
      # .iso8601 Throws an exception if not invoked on a valid date object, so it is used to check if the dates are valid
      begin
        body[:playerAttributes][:joinDate] = body[:playerAttributes][:joinDate].iso8601
        body[:playerAttributes][:dateOfBirth] = body[:playerAttributes][:dateOfBirth].iso8601
      rescue NoMethodError => exception
        raise Gameball::GameballError.new("Invalid Date Format, Please use Time and Date objects")
      end
      # Check for HTTP Success and throws error if not success
      res = Gameball::Utils::request("post", "/integrations/player", body)
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
    def self.get_player_info(playerUniqueId)
      if Gameball.api_version!="v3.0"
        body = { playerUniqueId: playerUniqueId }
        body["hash"] = Gameball::Utils::hashBody(playerUniqueId: playerUniqueId)
        res = Gameball::Utils::request("post", "/integrations/Player/Info", body)
      else
        res=Gameball::Utils::request("get","/integrations/player/#{playerUniqueId}")
      end
      # Check for HTTP Success and throws error if not success
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
    def self.get_player_balance(playerUniqueId)
        res=Gameball::Utils::request("get","/integrations/player/#{playerUniqueId}/balance")
      # Check for HTTP Success and throws error if not success
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
    def self.get_player_balance(playerUniqueId)
        res=Gameball::Utils::request("get","/integrations/player/#{playerUniqueId}/progress")
      # Check for HTTP Success and throws error if not success
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
    def self.attach_tags(playerUniqueId,tags)
      body={tags:tags}
      res=Gameball::Utils::request("post","/integrations/player/#{playerUniqueId}/tags",body)
      # Check for HTTP Success and throws error if not success
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
    def self.detach_tags(playerUniqueId,tags)
      body={tags:tags}
      res=Gameball::Utils::request("delete","/integrations/player/#{playerUniqueId}/tags",body)
      # Check for HTTP Success and throws error if not success
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
