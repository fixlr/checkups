class StatusConsumer
  def cache_key
    self.class.to_s
  end
end
