module Checkups
  module Consumers
    class StatusPageConsumer < StatusConsumer
      def consume
        msg = open(self.class::STATUS_URL).read
        new_status(JSON.parse(msg)['status'])
      end
    end
  end
end
