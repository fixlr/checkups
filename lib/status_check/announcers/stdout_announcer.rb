module StatusCheck
  module Announcers
    class StdoutAnnouncer < StatusAnnouncer
      def announce(status)
        puts status.sender, status.body, status.color
      end
    end
  end
end