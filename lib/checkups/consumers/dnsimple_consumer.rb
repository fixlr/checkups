module Checkups
  module Consumers
    class DnsimpleConsumer < StatusPageConsumer
      STATUS_URL = 'https://dnsimple.statuspage.io/api/v1/status.json'
    end
  end
end
