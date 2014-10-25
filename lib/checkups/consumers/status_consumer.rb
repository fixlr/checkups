module Checkups
  module Consumers
    class StatusConsumer
      def cache_key
        self.class.to_s
      end

      private

      def new_status(*args)
        status_class.new(*args)
      end

      def status_class
        klass = self.class.name.split('::').last.gsub(/Consumer$/, 'Status')
        Checkups::Statuses.const_get(klass)
      end
    end
  end
end
