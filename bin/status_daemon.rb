require 'clockwork'
require_relative '../lib/status_check'

module Clockwork
  handler do |job|
    StatusCheck::Runner.run
  end

  every(1.minutes, 'status-check')
end
