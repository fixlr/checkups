module Checkups
  module Statuses
    class Status < OpenStruct
      include Comparable

      def green?
        color == 'green'
      end

      def sender
        self.class::SENDER
      end

      def ==(other_status)
        return false unless other_status.is_a?(Status)
        (body == other_status.body) && (color == other_status.color)
      end
    end
  end
end
