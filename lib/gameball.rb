require "net/http"
require "net/http"
require "openssl"
require "uri"
require "Time"
require "digest/sha1"
require "json"
require_relative "./gameball/utils/request"
require_relative "./gameball/utils/helper"
require_relative "./gameball/utils/validation"
require_relative "./gameball/models/player"
require_relative "./gameball/models/event"
require_relative "./gameball/models/transaction"
require_relative "./gameball/models/referral"
require_relative "./gameball/models/coupon"
require_relative "./gameball/models/action"
require_relative "./gameball/exceptions/gameballException"

module Gameball
  @api_base = "https://gb-api.azurewebsites.net"
  @max_retries = 1
  @read_timeout = 60
  @keep_alive_timeout = 30
  @api_version = "v2.0"
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
