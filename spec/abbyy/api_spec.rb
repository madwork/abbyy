require 'spec_helper'

RSpec.describe Abbyy::API do
  let(:client) { Abbyy::Client.new "application_id", "password" }

  subject { described_class.new client }

  describe "#execute" do
    before { allow(subject).to receive(:process_image).and_return(true) }
    it { expect(subject.execute(:process_image)).to eq true }
  end
end
