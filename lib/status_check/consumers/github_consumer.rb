class GithubConsumer < StatusConsumer
  def consume
    msg = open('https://status.github.com/api/last-message.json').read
    GithubStatus.new(JSON.parse(msg))
  end
end
