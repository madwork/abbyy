module Abbyy
  module XML
    def task(resource)
      Hash.new.tap do |task|
        xml_data = REXML::Document.new(resource)
        task[:id] = xml_data.elements["response/task"].attributes["id"]
        task[:status] = xml_data.elements["response/task"].attributes["status"]
        task[:resultUrl] = xml_data.elements["response/task"].attributes["resultUrl"]
        task[:estimatedProcessingTime] = xml_data.elements["response/task"].attributes["estimatedProcessingTime"]
        task[:description] = xml_data.elements["response/task"].attributes["description"]
        task[:error] = xml_data.elements["response/task"].attributes["error"]
      end
    end
  end
end

