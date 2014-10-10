class StatusPageStatus < Status
  STATUS_COLORS = {
    'major' => 'red',
    'minor' => 'yellow',
    'good' => 'green',
    'none' => 'grey'
  }

  def body
    description
  end

  def color
    STATUS_COLORS[indicator]
  end
end
