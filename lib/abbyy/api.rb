require 'abbyy/xml'

module Abbyy
  module API
    include Abbyy::XML
    
    def process_image(image_path, options = {})
      task(RestClient.post("#{@url}/processImage", options.merge(:upload => { :file => File.new(image_path, 'r') })))
    end
    
    def process_business_card(image_path, options = {})
      task(RestClient.post("#{@url}/processBusinessCard", options.merge(:upload => { :file => File.new(image_path, 'r') })))
    end
    
    def get_task_status(task_id)
      task(RestClient.get("#{@url}/getTaskStatus?taskid=#{task_id}"))
    end
  end
end

