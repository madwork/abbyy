require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Abbyy" do
  describe "Client" do
    it "should get new abbyy client" do
      Abbyy::Client.new("Abbyy", "Abbyy").should_not be_nil
    end
  end
end
