require "amq/client/adapters/coolio"
require "amq/client/amqp/queue"
require "amq/client/amqp/exchange"
require "evented-spec"

def coolio_amqp_connect(&block)
  coolio do
    AMQ::Client::Coolio.connect(:port => 5672, :vhost => "/amq_client_testbed", :frame_max => 2**16-1, :heartbeat_interval => 1) do |client|
      yield client
    end
  end
end