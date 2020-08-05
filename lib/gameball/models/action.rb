module Gameball
    class Action
        def send_action(body)
            res=Gameball::Utils::request("post","/Integrations/Action",body)
            unless res.kind_of? Net::HTTPSuccess
                raise Gameball::GameballError.new(res) # use custom message
            else 
                return res
            end
        end
    end
end