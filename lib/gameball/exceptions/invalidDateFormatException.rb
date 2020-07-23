module Gameball
    class InvalidDateFormatError < StandardError
        def initialize(msg="Invalid date format please use UTC format")
            super msg
        end
    end
end