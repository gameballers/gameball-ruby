module Gameball
  module Utils
    extend self

    def validate(hash, required, optional) # Method used to validate body parameters by checking optional fields and required fields
      errors = []
      # Loop on required fields and throw error if field is not in ruby hash
      required.each do |val|
        raise Gameball::GameballError.new("Required key: #{val.to_sym.inspect}") unless hash.has_key?(val.to_sym)
      end
      allowed = optional + required
      # Loop on each field in ruby hash and check if it is allowed
      hash.each_key do |val|
        unless allowed.include?(val.to_s)
          raise Gameball::GameballError.new("Unknown key: #{val.to_sym.inspect}. Valid keys are: #{allowed.map(&:inspect).join(", ")}")
        end
      end
    end
  end
end
