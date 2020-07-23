require "net/http"
require "net/http"
require "openssl"
require "uri"
require 'Time'
require 'digest/sha1'
require 'json'
require "./gameball/getBot"
require "./gameball/request"
require "./gameball/helpers/helper"
require "./gameball/helpers/validation"
require "./gameball/resources/player"
require "./gameball/resources/event"
require "./gameball/resources/transaction"
require "./gameball/resources/referral"
require "./gameball/exceptions/authorizationException"
require "./gameball/exceptions/invalidDateFormatException"
require "./gameball/exceptions/missingParametersException"


module Gameball
    @api_base = "https://gb-api.azurewebsites.net"
    @max_retries=1
    @read_timeout=60
    @keep_alive_timeout=30
    @api_version="v1.0"
    class << self
        attr_accessor :api_key
        attr_accessor :api_version
        attr_accessor :transaction_key
        attr_accessor :read_timeout
        attr_accessor :max_retries
        attr_reader :keep_alive_timeout
        attr_reader :api_base

    end
end
