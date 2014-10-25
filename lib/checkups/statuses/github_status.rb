module Checkups
  module Statuses
    class GithubStatus < Status
      SENDER = 'GitHub Status'

      STATUS_COLORS = {
        'major' => 'red',
        'minor' => 'yellow',
        'good' => 'green'
      }

      def color
        STATUS_COLORS[status]
      end
    end
  end
end
