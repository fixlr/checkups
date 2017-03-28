module Checkups
  module Statuses
    class CloudConvertStatus < Status
      STATUS_COLORS = {
        '0' => 'grey',
        '1' => 'red',
        '2' => 'yellow',
        '3' => 'yellow',
        '4' => 'green'
      }

      def body
        message
      end

      def color
        STATUS_COLORS[status]
      end
    end
  end
end
