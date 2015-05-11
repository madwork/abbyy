require 'abbyy/api'
require 'abbyy/xml'
require 'abbyy/task'

module Abbyy
  class Client
    include Abbyy::XML
    include Abbyy::Task

    API_ENDPOINT = "cloud.ocrsdk.com"

    attr_reader :task

    def initialize(application_id = Abbyy.application_id, password = Abbyy.password)
      @appliction_id = application_id
      @password = password
      @task = {}
    end

    # @return [String] the api url with credentials
    def url
      @url ||= begin
        uri = URI::HTTP.build host: API_ENDPOINT
        uri.user = CGI.escape @appliction_id.to_s
        uri.password = CGI.escape @password.to_s if uri.user
        uri.to_s
      end
    end

    alias_method :current_task, :task

    # Retrieve the result of processing task
    #
    # @param [String] the url of the task result
    # @return [String] the xml representation
    def get(url = task[:resultUrl])
      RestClient.get(url)
    end

    # http://ocrsdk.com/documentation/apireference/listTasks/
    # @return [Array] the list of tasks created
    def list_tasks
      parse_task get("#{url}/listTasks")
    end

    def method_missing(meth, *args, &block)
      api = API.new self
      self.resource = api.execute meth, *args, &block
      current_task
    end

    private

    def resource=(resource)
      @task = parse_task(resource)
    end
  end
end
