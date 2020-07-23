module Gameball
    class Player
        # include Gameball::Request
        def self.create (customerBody)
            begin
            customerBody[:joinDate]=customerBody[:joined_date].iso8601
            customerBody[:dateOfBirth]=customerBody[:dateOfBirth].iso8601    
            rescue NoMethodError => exception
                raise Gameball::InvalidDateFormatError.new
            end
            
            Gameball::Request::request("post","/bots/BotSettings",customerBody)
        end
    end
end