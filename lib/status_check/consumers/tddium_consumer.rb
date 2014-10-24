module StatusCheck
  module Consumers
    class TddiumConsumer < StatusPageConsumer
      STATUS_URL = 'https://solanolabsinc.statuspage.io/api/v1/status.json'
    end
  end
end
