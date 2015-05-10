require 'spec_helper'

RSpec.describe Abbyy::Client do
  subject { described_class.new "application_id", "password" }

  describe "#initialize" do
    it { expect(subject.url).to eq "http://application_id:password@cloud.ocrsdk.com" }
  end
end
