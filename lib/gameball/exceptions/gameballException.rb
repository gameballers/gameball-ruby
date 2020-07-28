module Gameball
    class GameballException < StandardError
        def initialize (msg="Something went wrong while authorizing your request")
            super(msg)
        end
    end
end