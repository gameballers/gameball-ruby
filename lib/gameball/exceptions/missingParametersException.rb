module Gameball
class MissingParametersError < StandardError
def initialize(msg="Request body is missing required parameters")
super msg
end
end
end