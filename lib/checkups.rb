$:.unshift File.expand_path(File.dirname(__FILE__))

module Checkups
  def self.cache
    @cache ||= Dalli::Client.new(nil, namespace: 'status-check')
  end

  def self.env
    ENV.fetch('CHECKUPS_ENV', 'development')
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
Bundler.require(:default, Checkups.env)

require 'checkups/environment'
require 'checkups/config'
require 'checkups/runner'

require 'checkups/statuses/status'
require 'checkups/statuses/status_page_status'
require 'checkups/statuses/github_status'
require 'checkups/statuses/heroku_status'
require 'checkups/statuses/keen_status'
require 'checkups/statuses/tddium_status'

require 'checkups/consumers/status_consumer'
require 'checkups/consumers/status_page_consumer'
require 'checkups/consumers/github_consumer'
require 'checkups/consumers/heroku_consumer'
require 'checkups/consumers/keen_consumer'
require 'checkups/consumers/tddium_consumer'

require 'checkups/announcers/status_announcer'
require 'checkups/announcers/hipchat_announcer'
require 'checkups/announcers/stdout_announcer'
