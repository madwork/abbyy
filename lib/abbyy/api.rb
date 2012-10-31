module Abbyy
  module API
    @@api_methods = %w(process_image process_business_card get_task_status submit_image process_document list_tasks).map(&:to_sym)
    
    def execute(sym, *args, &block)
      self.resource = send("run_#{sym}", *args, &block)
      current_task
    rescue RestClient::BlockedByWindowsParentalControls => ex
      raise Abbyy::IncorrectParameters.new(parse_error(ex).message)
    rescue RestClient::RequestFailed => ex
      raise Abbyy::ProcessingFailed.new(parse_error(ex).message)
    end
    
    def method_missing(sym, *args, &block)
      @@api_methods.include?(sym) ? execute(sym, *args, &block) : super
    end
    
    private
    
    # http://ocrsdk.com/documentation/apireference/processImage/
    def run_process_image(image_path, options = {})
      RestClient.post("#{@url}/processImage", options.merge(:upload => { :file => File.new(image_path, 'r') }))
    end
    
    # http://ocrsdk.com/documentation/apireference/processBusinessCard/
    def run_process_business_card(image_path, options = {})
      RestClient.post("#{@url}/processBusinessCard", options.merge(:upload => { :file => File.new(image_path, 'r') }))
    end
    
    # http://ocrsdk.com/documentation/apireference/submitImage/
    def run_submit_image(image_path, options = {})
      RestClient.post("#{@url}/submitImage", options.merge(:upload => { :file => File.new(image_path, 'r') }))
    end
    
    # http://ocrsdk.com/documentation/apireference/getTaskStatus/
    def run_get_task_status(task_id = @task[:id])
      RestClient.get("#{@url}/getTaskStatus?taskId=#{task_id}")
    end
    
    # http://ocrsdk.com/documentation/apireference/listTasks/
    def run_list_tasks
      RestClient.get("#{@url}/listTasks")
    end
    
    # http://ocrsdk.com/documentation/apireference/processDocument/
    def run_process_document(task_id = @task[:id])
      RestClient.get("#{@url}/processDocument?taskId=#{task_id}")
    end
    
  end
end

