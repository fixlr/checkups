class Status < OpenStruct
  include Comparable

  def green?
    color == 'green'
  end

  def sender
    self.class::SENDER
  end
end
