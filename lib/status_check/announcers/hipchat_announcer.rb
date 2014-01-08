class HipchatAnnouncer < StatusAnnouncer
  def announce(status)
    client.rooms_message(room_id,
                         status.sender,
                         status.body,
                         announce_status_change,
                         status.color)
  end

  private

  def client
    @hipchat ||= HipChat::API.new(ENV.fetch('HIPCHAT_API_TOKEN'))
  end

  def api_token
    @api_token ||= ENV.fetch('HIPCHAT_API_TOKEN')
  end

  def room_id
    @room_id ||= ENV.fetch('HIPCHAT_ROOM_ID')
  end

  def announce_status_change
    @announce_status_change ||= ENV.fetch('HIPCHAT_ANNOUNCE_STATUS_CHANGE', 0)
  end
end
