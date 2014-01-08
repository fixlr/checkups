module StatusCheck
  class Runner
    def self.config
      Config.load(StatusCheck.root.join('config/checks.yml'))
    end

    def self.run
      announcer = config.announcer.new

      config.consumers.each do |consumer|
        status = consumer.new.consume
        announcer.attempt_announcement(status)
      end
    end
  end
end

