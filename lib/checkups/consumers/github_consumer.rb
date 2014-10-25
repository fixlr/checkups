module Checkups
  module Consumers
    class GithubConsumer < StatusConsumer
      def consume
        msg = open('https://status.github.com/api/last-message.json').read
        new_status(JSON.parse(msg))
      end
    end
  end
end
