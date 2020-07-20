module Gameball
    module Request
        extend self
        def request(verb,path,body={})
        #check for api_version and key and throw exceptions
            uri=URI(Gameball.api_base+'/api'+'/'+Gameball.api_version+path)

            https = Net::HTTP.new(uri.host,uri.port)

            https.use_ssl = true
            case verb.downcase
            when "post"
                req = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' =>'application/json'})

            when "get"
                
                req = Net::HTTP::Get.new(uri.path, initheader = {'Content-Type' =>'application/json'})
            when "put"
                
                req = Net::HTTP::Put.new(uri.path, initheader = {'Content-Type' =>'application/json'})

            when "delete"
                req = Net::HTTP::Delete.new(uri.path, initheader = {'Content-Type' =>'application/json'})
            else 
                puts "Please Provide a valid verb" # will later throw an exception
            end
            req['APIKey']=Gameball.api_key
            res=https.request(req)

            return res
            
        end
    end

end