class HerokuConsumer < StatusConsumer
  def consume
    msg = open('https://status.heroku.com/api/v3/issues?limit=1').read
    HerokuStatus.new(JSON.parse(msg).first)
  end
end
