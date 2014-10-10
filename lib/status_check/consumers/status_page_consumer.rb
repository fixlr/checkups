class StatusPageConsumer < StatusConsumer
  def consume
    msg = open(self.class::STATUS_URL).read
    KeenStatus.new(JSON.parse(msg)['status'])
  end
end
