require 'abbyy/api'

module Abbyy
  class Client
    include Abbyy::API
    
    def initialize(application_id, password)
      @appliction_id = application_id
      @password = password
      @url = "http://#{CGI.escape(@appliction_id)}:#{CGI.escape(@password)}@cloud.ocrsdk.com"
    end
    
    def get(url)
      RestClient.get(url)
    end
    
  end
end

