module Checkups
  module Consumers
    class TrelloConsumer < StatusPageConsumer
      STATUS_URL = 'https://www.trellostatus.com/api/v1/status.json'
    end
  end
end
