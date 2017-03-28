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
      trap_signals
      schedule_consumers
      scheduler.join
    end

    private

    def checkup(consumer)
      status = consumer.new.consume
      announcer.attempt_announcement(status)
    rescue => err
      logger.error("#{err.class}: #{err.message}")
    end

    def schedule_consumers
      consumers.each do |consumer|
        scheduler.every '1m' do
          checkup(consumer)
        end
      end
    end

    def config
      @config ||= Config.load
    end

    def consumers
      config.consumers
    end

    def logger
      @logger ||= ::Logger.new(STDOUT)
    end

    def trap_signals
      trap('INT') { shutdown }
      trap('TERM') { shutdown }
    end

    def shutdown
      scheduler.shutdown(:kill)
      puts 'Shutting down...'
      exit
    end
  end
end
