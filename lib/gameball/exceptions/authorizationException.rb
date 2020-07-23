module Gameball
    class AuthorizationError < StandardError
        def initialize (msg="Something went wrong while authorizing your request")
            super(msg)
        end
    end
end