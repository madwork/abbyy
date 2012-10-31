require 'abbyy/api'
require 'abbyy/xml'
require 'abbyy/task'

module Abbyy
  class Client
    include Abbyy::API
    include Abbyy::XML
    include Abbyy::Task
    
    attr_reader :task
    
    def initialize(application_id = Abbyy.application_id, password = Abbyy.password)
      @appliction_id = application_id
      @password = password
      @url = "http://#{CGI.escape(@appliction_id)}:#{CGI.escape(@password)}@cloud.ocrsdk.com"
      @task = {}
    end
    
    def resource=(resource)
      @task = parse_task(resource)
    end
    
    def get(url = @task[:resultUrl])
      RestClient.get(url)
    end
    
    alias_method :current_task, :task
  end
end

