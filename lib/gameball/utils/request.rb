module Gameball
  module Utils
    extend self

    def request(verb, path, body = {})
      #check for api_version and key and throw exceptions
      if !Gameball.api_key
        raise Gameball::GameballError.new("Please provide the api_key before making a request, try Gameball::api_key='your_key'")
      end
      uri = URI(Gameball.api_base + "/api" + "/" + Gameball.api_version + path)

      https = Net::HTTP.new(uri.host, uri.port)
      https.max_retries = Gameball.max_retries
      https.read_timeout = Gameball.read_timeout
      https.keep_alive_timeout = Gameball.keep_alive_timeout
      https.use_ssl = true

      case verb.downcase
      when "post"
        req = Net::HTTP::Post.new(uri.path, initheader = { "Content-Type" => "application/json" })
      when "get"
        req = Net::HTTP::Get.new(uri.path, initheader = { "Content-Type" => "application/json" })
      when "put"
        req = Net::HTTP::Put.new(uri.path, initheader = { "Content-Type" => "application/json" })
      when "delete"
        req = Net::HTTP::Delete.new(uri.path, initheader = { "Content-Type" => "application/json" })
      else
        raise Gameball::GameballException.new("Please provide a valid HTTP Verb") # will later throw an exception
      end
      if body != {}
        # puts body
        # begin
        req.body = body.to_json
        # p req.body
        # rescue JSON::ParserError => exception

        # end

      end
      req["APIKey"] = Gameball.api_key
      res = https.request(req)
      return res
    end

    def request_async(verb, path, body = {})
      #check for api_version and key and throw exceptions
      if !Gameball.api_key
        raise Gameball::GameballError.new("Please provide the api_key before making a request, try Gameball::api_key='your_key'")
      end
      uri = URI(Gameball.api_base + "/api" + "/" + Gameball.api_version + path)

      https = Net::HTTP.new(uri.host, uri.port)
      https.max_retries = Gameball.max_retries
      https.read_timeout = Gameball.read_timeout
      https.keep_alive_timeout = Gameball.keep_alive_timeout
      https.use_ssl = true

      case verb.downcase
      when "post"
        req = Net::HTTP::Post.new(uri.path, initheader = { "Content-Type" => "application/json" })
      when "get"
        req = Net::HTTP::Get.new(uri.path, initheader = { "Content-Type" => "application/json" })
      when "put"
        req = Net::HTTP::Put.new(uri.path, initheader = { "Content-Type" => "application/json" })
      when "delete"
        req = Net::HTTP::Delete.new(uri.path, initheader = { "Content-Type" => "application/json" })
      else
        puts "Please Provide a valid verb" # will later throw an exception
      end
      if body != {}
        # puts body
        # begin
        req.body = body.to_json
        # p req.body
        # rescue JSON::ParserError => exception

        # end

      end
      req["APIKey"] = Gameball.api_key
      Thread.new do
        res = https.request(req)
        return res
        p "I am in thread" + res.body
      end
      # thread.join
      # return res
    end
  end
end
