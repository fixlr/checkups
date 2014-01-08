class HerokuStatus < Status
  SENDER = 'Heroku Status'

  def body
    updates.first['contents']
  end

  def color
    status_prod
  end
end
