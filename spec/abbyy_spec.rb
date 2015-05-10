require 'spec_helper'

RSpec.describe Abbyy do
  describe ".configure" do
    it "should setup credentials" do
      described_class.configure do |config|
        config.application_id = "application_id"
        config.password = "password"
      end
      expect(described_class.application_id).to eq "application_id"
      expect(described_class.password).to eq "password"
    end
  end

  it "has a version number" do
    expect(Abbyy::VERSION).to_not be nil
  end
end
