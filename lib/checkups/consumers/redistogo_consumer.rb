module Checkups
  module Consumers
    class RedistogoConsumer < StatusPageConsumer
      STATUS_URL = 'http://status.redistogo.com/api/v1/status.json'
    end
  end
end
