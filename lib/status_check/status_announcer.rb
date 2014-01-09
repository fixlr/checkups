class StatusAnnouncer
  def attempt_announcement(status)
    return if skippable?(status)
    announce(status)
    self.last_status = status
  end

  # Skip unimportant announcements
  def skippable?(status)
    last_status = last_status_for_consumer(status)
    return true if status.green? && last_status.nil?
    status == last_status
  end

  def last_status_for_consumer(status)
    cache.get(status.class.to_s)
  end

  def last_status=(status)
    cache.set(status.class.to_s, status)
  end

  def cache_key
    self.class.to_s
  end

  def cache
    StatusCheck.cache
  end
end
