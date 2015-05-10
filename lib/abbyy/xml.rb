module Abbyy
  module XML
    def parse_task(resource)
      xml_data = REXML::Document.new(resource)
      if xml_data.elements["response"].size > 1
        Array.new.tap do |tasks|
          xml_data.elements["response"].each { |response| tasks << build_task(response) }
        end
      else
        build_task(xml_data.elements["response/task"])
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

    private

    def build_task(xml_data)
      Hash.new.tap do |task|
        task[:id] = xml_data.attributes["id"]
        task[:status] = xml_data.attributes["status"]
        task[:resultUrl] = xml_data.attributes["resultUrl"]
        task[:estimatedProcessingTime] = xml_data.attributes["estimatedProcessingTime"]
        task[:description] = xml_data.attributes["description"]
        task[:error] = xml_data.attributes["error"]
        task[:credits] = xml_data.attributes["credits"]
        task[:filesCount] = xml_data.attributes["filesCount"]
        task[:statusChangeTime] = xml_data.attributes["statusChangeTime"]
        task[:registrationTime] = xml_data.attributes["registrationTime"]
      end
    end
  end
end
