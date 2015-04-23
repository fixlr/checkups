module Checkups
  module Consumers
    class HipchatConsumer < StatusPageConsumer
      STATUS_URL = 'https://status.hipchat.com/api/v1/incidents.json'

      def consume
        msg = open(STATUS_URL).read
        new_status(JSON.parse(msg)['incidents'].first)
      end
    end
  end
end
