$:.unshift File.expand_path(File.dirname(__FILE__))

module Checkups
  def self.cache
    @cache ||= Dalli::Client.new(nil, namespace: 'status-check')
  end

  def self.env
    ENV.fetch('CHECKUPS_ENV', 'development')
  end
end

require 'forwardable'
require 'json'
require 'logger'
require 'open-uri'
require 'pathname'

require 'bundler'
Bundler.require(:default, Checkups.env)

require 'checkups/environment'
require 'checkups/config'
require 'checkups/runner'
require 'checkups/statuses/status'
require 'checkups/statuses/status_page_status'
require 'checkups/consumers/status_consumer'
require 'checkups/consumers/status_page_consumer'
require 'checkups/announcers/status_announcer'

Dir[File.dirname(__FILE__) + '/checkups/**/*.rb'].each do |file|
  require file
end
