module Abbyy
  module XML
    def parse_task(resource)
      Hash.new.tap do |task|
        xml_data = REXML::Document.new(resource)
        task[:id] = xml_data.elements["response/task"].attributes["id"]
        task[:status] = xml_data.elements["response/task"].attributes["status"]
        task[:resultUrl] = xml_data.elements["response/task"].attributes["resultUrl"]
        task[:estimatedProcessingTime] = xml_data.elements["response/task"].attributes["estimatedProcessingTime"]
        task[:description] = xml_data.elements["response/task"].attributes["description"]
        task[:error] = xml_data.elements["response/task"].attributes["error"]
        task[:credits] = xml_data.elements["response/task"].attributes["credits"]
        task[:filesCount] = xml_data.elements["response/task"].attributes["filesCount"]
        task[:statusChangeTime] = xml_data.elements["response/task"].attributes["statusChangeTime"]
        task[:registrationTime] = xml_data.elements["response/task"].attributes["registrationTime"]
      end
    end
    
    AbbyyXmlError = Struct.new(:code, :message)
    
    def parse_error(resource)
      AbbyyXmlError.new.tap do |error|
        xml_data = REXML::Document.new(resource.http_body)
        error.code = resource.http_code
        error.message = xml_data.elements["error/message"].text
      end
    end
  end
end

