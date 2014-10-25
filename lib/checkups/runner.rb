module Checkups
  class Runner
    attr_reader :announcer, :scheduler

    def self.run(scheduler)
      new(scheduler).run
    end

    def initialize(scheduler)
      @announcer = config.announcer.new
      @scheduler = scheduler
    end

    def run
      schedule_consumers
      scheduler.join
    end

    private

    def schedule_consumers
      consumers.each do |consumer|
        schedule_checkup(consumer)
      end
    end

    def schedule_checkup(consumer)
      scheduler.every '1m' do
        status = consumer.new.consume
        announcer.attempt_announcement(status)
      end
    end

    def config
      @config ||= Config.load
    end

    def consumers
      config.consumers
    end
  end
end
