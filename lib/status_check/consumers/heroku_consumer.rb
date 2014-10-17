module StatusCheck
  module Consumers
    class HerokuConsumer < StatusConsumer
      def consume
        msg = open('https://status.heroku.com/api/v3/issues?limit=1').read
        new_status(JSON.parse(msg).first)
      end
    end
  end
end
