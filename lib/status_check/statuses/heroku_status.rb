class HerokuStatus < Status
  SENDER = 'Heroku Status'

  def body
    [title, latest_update].join(': ')
  end

  def color
    status_prod
  end

  def latest_update
    updates.first['contents']
  end
end
