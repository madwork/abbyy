require 'rest-client'
require 'rexml/document'
require 'cgi'

require 'abbyy/version'
require 'abbyy/client'
require 'abbyy/exceptions'

module Abbyy
  extend self

  attr_accessor :application_id, :password

  # Abbyy.configure do |config|
  #   config.application_id = 'application_id'
  #   config.password = 'password'
  # end
  def configure
    yield self
  end
end
