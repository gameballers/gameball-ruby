require "net/http"
require "net/http"
require "openssl"
require "uri"
require "Time"
require "digest/sha1"
require "json"
<<<<<<< HEAD
require "async"
=======
>>>>>>> aece124df52cb5113b88b74b8e8eb5c68bec89ef
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
<<<<<<< HEAD
  @api_version = "v1.0"
=======
  @api_version = "v2.0"
>>>>>>> aece124df52cb5113b88b74b8e8eb5c68bec89ef
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
