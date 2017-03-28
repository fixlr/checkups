module Checkups
  module Consumers
    class CloudConvertConsumer < StatusConsumer
      def consume
        msg = open("https://status.cloudconvert.com/api/v1/incidents?page=#{total_pages}").read
        new_status(JSON.parse(msg).fetch('data', []).last)
      end

      private

      def total_pages
        msg = open('https://status.cloudconvert.com/api/v1/incidents').read
        JSON.parse(msg)
          .fetch('meta', {})
          .fetch('pagination', {})
          .fetch('total_pages', 1)
      end
    end
  end
end
