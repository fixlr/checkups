module StatusCheck
  class Config
    attr_reader :announcer, :consumers

    def self.load(opts = ENV)
      new(opts)
    end

    def initialize(opts = {})
      @announcer = get_announcer(opts.fetch('ANNOUNCER', 'Stdout'))
      @consumers = get_consumers(opts.fetch('CONSUMERS', ''))
    end

    private

    def get_announcer(name)
      StatusCheck::Announcers.const_get("#{name.strip}Announcer")
    end

    def get_consumers(names)
      names.split(',').map {|name| StatusCheck::Consumers.const_get("#{name.strip}Consumer") }
    end
  end
end
