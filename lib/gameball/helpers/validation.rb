module Gameball
  module Validations
    extend self
      def validate (hash,required,optional)
        errors=[]
        required.each do |val|          
          raise Gameball::MissingParametersError.new("Required key: #{val.to_sym.inspect}") unless hash.has_key?(val.to_sym)
        end
        optional=optional+required
        hash.each_key do |val|
          unless optional.include?(val.to_s)
          raise Gameball::MissingParametersError.new("Unknown key: #{val.to_sym.inspect}. Valid keys are: #{optional.map(&:inspect).join(', ')}")
          end
        end
      end
  end
end

