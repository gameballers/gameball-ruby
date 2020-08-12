module Gameball
  class GameballError < StandardError # Custom GameballError that inherits from Ruby StandardError
    def initialize(msg = "Something went wrong while authorizing your request")
      super(msg)
    end
  end
end
