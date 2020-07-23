module Gameball
    class Player
        # include Gameball::Request
        def self.create (customerBody)
            Gameball::Validations.validate(customerBody,['playerAttributes','playerUniqueId'],[])
            Gameball::Validations.validate(customerBody[:playerAttributes],['displayName','firstName','lastName','email','gender','mobileNumber','dateOfBirth','joinDate'],['custom'])
            begin
            customerBody[:playerAttributes][:joinDate]=customerBody[:playerAttributes][:joinDate].iso8601
            customerBody[:playerAttributes][:dateOfBirth]=customerBody[:playerAttributes][:dateOfBirth].iso8601    
            rescue NoMethodError => exception
                p exception
                raise Gameball::InvalidDateFormatError.new
            end
            
            Gameball::Request::request("post","/bots/BotSettings",customerBody)
        end
    end
end