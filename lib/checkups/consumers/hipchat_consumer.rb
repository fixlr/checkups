module Checkups
  module Consumers
    class HipchatConsumer < StatusPageConsumer
      STATUS_URL = 'https://status.hipchat.com/api/v1/status.json'
    end
  end
end
