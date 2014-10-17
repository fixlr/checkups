$:.unshift File.expand_path(File.dirname(__FILE__))

module StatusCheck
  def self.cache
    @cache ||= Dalli::Client.new(nil, namespace: 'status-check')
  end

  def self.env
    ENV.fetch('STATUS_CHECK_ENV', 'development')
  end

  def self.root
    Pathname.new(File.expand_path(File.dirname(__FILE__) + '/..'))
  end
end

require 'forwardable'
require 'json'
require 'open-uri'
require 'pathname'

require 'bundler'
Bundler.require(:default, StatusCheck.env)

require 'status_check/environment'
require 'status_check/config'
require 'status_check/runner'

require 'status_check/statuses/status'
require 'status_check/statuses/status_page_status'
require 'status_check/statuses/github_status'
require 'status_check/statuses/heroku_status'
require 'status_check/statuses/keen_status'

require 'status_check/consumers/status_consumer'
require 'status_check/consumers/status_page_consumer'
require 'status_check/consumers/github_consumer'
require 'status_check/consumers/heroku_consumer'
require 'status_check/consumers/keen_consumer'

require 'status_check/announcers/status_announcer'
require 'status_check/announcers/hipchat_announcer'
require 'status_check/announcers/stdout_announcer'
