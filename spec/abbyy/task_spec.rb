require 'spec_helper'

RSpec.describe Abbyy::Task do
  let(:client) { Abbyy::Client.new "application_id", "password" }

  describe "#current_task_id" do
    context "without current task" do
      it { expect(client.current_task_id).to be_nil }
    end

    context "with current task" do
      before { allow(client).to receive(:current_task).and_return(id: "6fd49335-455f-42a2-8b97-39f71a1308c0") }
      it { expect(client.current_task_id).to eq "6fd49335-455f-42a2-8b97-39f71a1308c0" }
    end
  end
end
