module Checkups
  module Consumers
    class DnsimpleConsumer < StatusPageConsumer
      STATUS_URL = 'http://dnsimplestatus.com/api/v1/status.json'
    end
  end
end
