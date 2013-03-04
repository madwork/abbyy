# abbyy

Simple Ruby wrapper for Abbyy Cloud OCR SDK

## Installation

Add this line to your application's Gemfile:

    gem 'abbyy', :github => 'madwork/abbyy'

And then execute:

    $ bundle

Or install it yourself as:

    $ git clone git://github.com/madwork/abbyy.git
    $ cd abbyy
    $ rake install

## Usage with IRB/Pry

    pry -I lib -r abbyy

    client = Abbyy::Client.new(APPLICATION_ID, PASSWORD)
    client.process_business_card "/home/vincent/Picture_samples/English/Business_cards/doc10002.tif", :exportFormat => 'xml', :imageSource => 'photo'
    client.get_task_status
    client.get

## Usage with Ruby on Rails

    $ touch config/initializers/load_abbyy.rb

    require 'abbyy'
    
    Abbyy.configure do |config|
      config.application_id = APPLICATION_ID
      config.password = PASSWORD
    end

## Example with Resque

    $ touch app/workers/image_scanner.rb

    client = Abbyy::Client.new
    client.process_business_card attachment.full_filename, :exportFormat => 'xml', :imageSource => 'photo'
    while %w(Queued InProgress).include?(client.task[:status])
      sleep(client.task[:estimatedProcessingTime].to_i)
      client.get_task_status
    end
    if client.task[:status] == 'Completed'
      xml_data = REXML::Document.new(client.get)
      ...
    else
      ...
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
