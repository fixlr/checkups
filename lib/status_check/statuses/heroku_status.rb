module StatusCheck
  module Statuses
    class HerokuStatus < Status
      SENDER = 'Heroku Status'

      def body
        [title, latest_update].join(': ')
      end

      def color
        status_prod
      end

      def latest_update
        updates.first.fetch('contents', '').gsub(/(?:\n\r?|\r\n?)/, '<br>')
      end
    end
  end
end