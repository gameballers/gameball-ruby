module Gameball
    class Player
        # include Gameball::Request
        def self.initialize_player (customerBody)
            Gameball::Utils.validate(customerBody,['playerAttributes','playerUniqueId'],[])
            # Gameball::Utils.validate(customerBody[:playerAttributes],['displayName','firstName','lastName','email','gender','mobileNumber','dateOfBirth','joinDate'],['custom'])
            begin
            customerBody[:playerAttributes][:joinDate]=customerBody[:playerAttributes][:joinDate].iso8601
            customerBody[:playerAttributes][:dateOfBirth]=customerBody[:playerAttributes][:dateOfBirth].iso8601    
            rescue NoMethodError => exception
                p exception
                raise Gameball::GameballError.new("Invalid Date Format, please use UTC format")
            end
            
            res=Gameball::Utils::request("post","/integrations/player",customerBody)
            unless res.kind_of? Net::HTTPSuccess
                raise Gameball::GameballError.new(res) # use custom message
            else 
                return res
            end
        end
        def self.get_player_info(playerUniqueId)
            body={playerUniqueId:playerUniqueId}
            body["bodyHashed"]=Gameball::Utils::hashBody(playerUniqueId:playerUniqueId)
            res=Gameball::Utils::request("post","/integrations/Player/Info",body)
            unless res.kind_of? Net::HTTPSuccess
                raise Gameball::GameballError.new(res) # use custom message
            else 
                return res
            end
        end
    end
end