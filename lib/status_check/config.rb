module StatusCheck
  class Config
    attr_reader :announcer, :consumers

    def self.load(path)
      new(YAML.load_file(path))
    end

    def initialize(opts = {})
      @announcer = get_announcer(opts['announcer'])
      @consumers = get_consumers(opts['consumers'])
    end

    private

    def get_announcer(name)
      Object.const_get("#{name}Announcer")
    end

    def get_consumers(names)
      names.map {|name| Object.const_get("#{name}Consumer") }
    end
  end
end
