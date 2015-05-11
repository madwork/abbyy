require 'abbyy/inflector'

module Abbyy
  module Task
    include Inflector

    @@attributes = %w(id status result_url registration_time error description estimated_processing_time credits files_count status_change_time)

    @@attributes.each do |attribute|
      define_method("current_task_#{attribute}") do
        current_task[camelize(attribute).to_sym]
      end
    end
  end
end
