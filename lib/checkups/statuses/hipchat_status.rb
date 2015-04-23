module Checkups
  module Statuses
    class HipchatStatus < Status
      SENDER = 'HipChat'

      IMPACT_COLORS = {
        'major' => 'red',
        'minor' => 'yellow',
        'none' => 'yellow'
      }

      def body
        "#{name}: #{last_update['body']}"
      end

      def color
        return 'green' if resolved?
        IMPACT_COLORS.fetch(impact, 'yellow')
      end

      private

      def last_update
        incident_updates.first
      end

      def resolved?
        status == 'resolved'
      end

      def status
        last_update['status']
      end
    end
  end
end
