module Gameball
    class Player
        def initialize 
        end
        # include Gameball::Request
        def self.initialize_player (customerBody)
            Gameball::Utils.validate(customerBody,['playerAttributes','playerUniqueId'],[])
            Gameball::Utils.validate(customerBody[:playerAttributes],['displayName','firstName','lastName','email','gender','mobileNumber','dateOfBirth','joinDate'],['custom'])
            begin
            customerBody[:playerAttributes][:joinDate]=customerBody[:playerAttributes][:joinDate].iso8601
            customerBody[:playerAttributes][:dateOfBirth]=customerBody[:playerAttributes][:dateOfBirth].iso8601    
            rescue NoMethodError => exception
                p exception
                raise Gameball::InvalidDateFormatError.new
            end
            
            res=Gameball::Utils::request("post","/integrations/initializeplayer",customerBody)
            unless res.kind_of? Net::HTTPSuccess
                raise Gameball::GameballException.new(res) # use custom message
            else 
                return res
            end
        end
    end
end