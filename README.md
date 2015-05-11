# abbyy

Simple Ruby wrapper for Abbyy Cloud OCR SDK

[![Build Status](https://img.shields.io/travis/madwork/abbyy.svg)](https://travis-ci.org/madwork/abbyy)
[![Gem](https://img.shields.io/gem/v/abbyy.svg)](https://rubygems.org/gems/abbyy)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'abbyy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install abbyy

### Example

```ruby
client = Abbyy::Client.new(APPLICATION_ID, PASSWORD)
client.process_business_card "business_card.png", exportFormat: 'xml', imageSource: 'photo'
client.get_task_status
client.get
```

### Example with Ruby on Rails

    $ touch config/initializers/abbyy.rb

```ruby
require 'abbyy'

Abbyy.configure do |config|
  config.application_id = APPLICATION_ID
  config.password = PASSWORD
end
```

Everywhere in your rails application, you can access Abbyy without crendentials:

```ruby
client = Abbyy::Client.new
client.process_image "image.png"
```

### Example with Resque

Create new worker ImageScanner:

    $ touch app/workers/image_scanner.rb

```ruby
class ImageScanner
  @queue = :scanner

  def self.perform(attachment_id)
    attachment = Attachment.find_by_id(attachment_id)
    client = Abbyy::Client.new
    client.process_business_card attachment.full_filename, exportFormat: 'xml', imageSource: 'photo'
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
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

1. Fork it ( https://github.com/madwork/abbyy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
