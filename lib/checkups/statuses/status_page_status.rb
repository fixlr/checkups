module Checkups
  module Statuses
    class StatusPageStatus < Status
      STATUS_COLORS = {
        'critical' => 'red',
        'major' => 'red',
        'minor' => 'yellow',
        'good' => 'green',
        'none' => 'grey'
      }

      def body
        description
      end

      def color
        STATUS_COLORS[indicator]
      end
    end
  end
end
