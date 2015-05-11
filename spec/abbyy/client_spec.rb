require 'spec_helper'

RSpec.describe Abbyy::Client do
  subject { described_class.new "application_id", "password" }

  it "has an api endpoint" do
    expect(Abbyy::Client::API_ENDPOINT).to eq "cloud.ocrsdk.com"
  end

  describe "#initialize" do
    it { expect(subject.task).to eq Hash.new }
  end

  describe "#url" do
    context "with credentials" do
      it { expect(subject.url).to eq "http://application_id:password@cloud.ocrsdk.com" }
    end

    context "with unescaped credentials" do
      subject { described_class.new "application_id", "pass/word" }
      it { expect(subject.url).to eq "http://application_id:pass%2Fword@cloud.ocrsdk.com" }
    end

    context "without credentials" do
      subject { described_class.new }
      it { expect(subject.url).to eq "http://cloud.ocrsdk.com" }
    end
  end
end
