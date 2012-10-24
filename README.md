= abbyy

Simple (incompleted) Ruby wrapper for Abbyy Cloud OCR SDK

== HOWTO

pry -I lib -r abbyy

> client = Abbyy::Client.new(APPLICATION_ID, PASSWORD)
> result = client.process_business_card("/home/vincent/Picture_samples/English/Business_cards/doc10002.tif", :exportFormat => 'xml', :imageSource => 'photo')
> task = client.get_task_status(result[:id])
> client.get task[:id]

== Contributing to abbyy
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2012 Vincent Durand. See LICENSE.txt for
further details.

