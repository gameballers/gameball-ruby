require "net/http"
require "openssl"
require "uri"
module Gameball
    @api_base = "https://gb-api.azurewebsites.net"
    class << self
        attr_accessor :api_key
        attr_accessor :api_version
        attr_reader :api_base

    end
end
