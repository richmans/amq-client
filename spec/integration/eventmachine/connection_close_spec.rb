require 'spec_helper'
require 'integration/eventmachine/spec_helper'

describe AMQ::Client::EventMachineClient, "Connection.Close" do
  include EventedSpec::SpecHelper
  default_timeout 0.5

  it "should issue a callback and close connection" do
    em do
      AMQ::Client::EventMachineClient.connect do |client|
        @client = client
        client.should be_opened
        client.close do
          done
        end
      end
    end
    @client.should be_closed
  end
end