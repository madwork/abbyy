require 'abbyy/api'
require 'abbyy/xml'

module Abbyy
  class Client
    include Abbyy::API
    include Abbyy::XML
    
    attr_reader :status
    
    def initialize(application_id = Abbyy.application_id, password = Abbyy.password)
      @appliction_id = application_id
      @password = password
      @url = "http://#{CGI.escape(@appliction_id)}:#{CGI.escape(@password)}@cloud.ocrsdk.com"
      @status = {}
    end
    
    def task_status=(resource)
      @status = task(resource)
    end
    
    def get(url = @status[:resultUrl])
      RestClient.get(url)
    end
    
  end
end

